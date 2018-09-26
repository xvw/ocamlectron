(** Describe a Size *)

open Js 

class type size = object 
  method width : int readonly_prop
  method height : int readonly_prop
end

type t = size Js.t