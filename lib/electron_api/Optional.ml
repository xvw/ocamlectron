open Js_of_ocaml

module type REQ = 
sig
  type 'a t
  val empty : 'a t 
  val pure : 'a -> 'a t 
  val map : 'a t -> ('a -> 'b)-> 'b t
  val bind : 'a t -> ('a -> 'b t) -> 'b t
  val test : 'a t -> bool
  val iter : 'a t -> ('a -> unit) -> unit
  val case : 'a t -> (unit -> 'b) -> ('a -> 'b) -> 'b
  val get : 'a t -> (unit -> 'a) -> 'a
  val from_opt : 'a Js.Opt.t -> 'a t
  val from_optdef : 'a Js.Optdef.t -> 'a t
  val from_option : 'a option -> 'a t
  val to_opt : 'a t -> 'a Js.Opt.t
  val to_optdef : 'a t -> 'a Js.Optdef.t
  val to_option : 'a t -> 'a option
end

module type OPTION =
sig
  include REQ
  val to_bool : 'a t -> bool
  module Infix : 
  sig 
    val (>>=) : 'a t -> ('a -> 'b t) -> 'b t
    val (>|=) : 'a t -> ('a -> 'b) -> 'b t
    val (>>!) : 'a t -> (unit -> 'a) -> 'a
  end
  include module type of Infix
end

module Make (F : REQ) : OPTION with type 'a t = 'a F.t =
struct
  include F
  let to_bool x = 
    case x (fun () -> false) (fun _ -> true)

  module Infix = 
  struct 
    let (>>=) = bind
    let (>|=) = map
    let (>>!) = get
  end

  include Infix
end

module Option : OPTION with type 'a t = 'a option = Make(
  struct
    type 'a t = 'a option
    let empty = None
    let pure x = Some x 
    
    let map opt f =
      match opt with
      | Some x -> Some (f x)
      | None -> None

    let bind opt f =
      match opt with
      | Some x -> f x
      | None -> None 

    let test = function
      | None -> false
      | Some _ -> true

    let iter opt f =
      match opt with
      | Some x -> f x
      | None -> ()

    let case opt elseN ifS =
      match opt with
      | Some x -> ifS x
      | None -> elseN ()

    let get opt f =
      match opt with
      | Some x -> x
      | None -> f ()

    let to_option x = x
    let from_option x = x

    let to_optdef = Js.Optdef.option
    let from_optdef = Js.Optdef.to_option
    let to_opt = Js.Opt.option
    let from_opt = Js.Opt.to_option
  end
)

module Opt : OPTION with type 'a t = 'a Js.Opt.t = Make(
  struct
    include Js.Opt
    let pure = return
    let to_opt x = x
    let from_opt x = x
    let from_option = option

    let to_optdef opt =
      match to_option opt with
      | Some x -> Js.Optdef.return x
      | None -> Js.Optdef.empty

    let from_optdef optdef =
      match Js.Optdef.to_option optdef with
      | Some x -> return x
      | None -> empty
  end
)

module Optdef : OPTION with type 'a t = 'a Js.Optdef.t = Make(
  struct 
    include Js.Optdef
    let pure = return
    let to_optdef x = x
    let from_optdef x = x
    let from_option = option
    let to_opt opt =
      match to_option opt with
      | Some x -> Js.Opt.return x
      | None -> Js.Opt.empty
    let from_opt optdef =
      match Js.Opt.to_option optdef with
      | Some x -> return x
      | None -> empty
  end
)
