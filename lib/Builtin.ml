open Js

module Set = 
struct 

  let constr = Js.Unsafe.global##._Set

  class type ['a] t = object 
    method size : int readonly_prop
    method add : 'a -> unit meth
    method clear : unit -> unit meth
    method delete : 'a -> unit meth
    method has : 'a -> (bool Js.t) meth
    method forEach : 
      ('a -> 'a Optdef.t  -> 'a t Js.t Optdef.t -> unit) callback
      -> 'b Optdef.t -> unit meth
  end

  let make objects = 
    let array = new%js array_empty in 
    let () = List.iteri (array_set array) objects in 
    new%js constr array

end