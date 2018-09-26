(** Built-in JavaScript 's object  *)


open Js

module Promise : 
sig 

  class type ['a] promise = object 
    method _then : ('a -> 'b promise t) -> 'b promise t meth
  end

  type 'a t = 'a promise Js.t
end

module Set : 
sig

  val constr : ('a js_array -> 'a t Js.t) constr

  class type ['a] set = object 

    method size : int readonly_prop
    method add : 'a -> unit meth
    method clear : unit -> unit meth
    method delete : 'a -> unit meth
    method forEach : 
      ('a -> 'a Optdef.t  -> 'a t Js.t Optdef.t -> unit) callback
      -> unit meth

    method has : 'a -> (bool Js.t) meth
  end

  type 'a t = 'a set Js.t

  val make : 'a list -> 'a t
  val iteri : (int -> 'a -> unit) -> 'a t -> unit 

end