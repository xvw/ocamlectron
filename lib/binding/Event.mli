open Js 

class type event = object 
  method preventDefault : unit -> unit meth
end

type t = event Js.t
(** Main type *)