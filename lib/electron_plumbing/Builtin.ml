open Js_of_ocaml
open Js

module Promise = 
struct 

  class type ['a] promise = object 
    method _then : ('a -> 'b promise t) -> 'b promise t meth
  end

  type 'a t = 'a promise Js.t
end


module Set = 
struct 

  let constr = Js.Unsafe.global##._Set

  class type ['a] set = object 
    method size : int readonly_prop
    method add : 'a -> unit meth
    method clear : unit -> unit meth
    method delete : 'a -> unit meth
    method has : 'a -> (bool Js.t) meth
    method forEach : 
      ('a -> 'a Optdef.t  -> 'a t Js.t Optdef.t -> unit) callback
      ->  unit meth
  end

  type 'a t = 'a set Js.t

  let make objects = 
    let array = new%js array_empty in 
    let () = List.iteri (array_set array) objects in 
    new%js constr array

  let iteri f set = 
    let i = ref 0 in
    let callback elt _ _ = 
      let () = f !i elt in 
      incr i
    in
    set ## forEach (wrap_callback callback)

end

module Buffer = 
struct

  class type buffer = object 
    (** To be done *)
  end

  type t = buffer Js.t

end

module Error =
struct

  class type error = object
    method message : js_string t readonly_prop
    method stack: js_string t readonly_prop
    method code : js_string t readonly_prop
  end

  type t = error Js.t

end
