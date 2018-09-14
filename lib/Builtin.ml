open Js

module Set = 
struct 

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

end