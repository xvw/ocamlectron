open Js

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