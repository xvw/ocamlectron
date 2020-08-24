(** Describe a Size *)

open Js_of_ocaml
open Js 

class type size = object 
  method width : int readonly_prop
  method height : int readonly_prop
end

type t = size Js.t
