(** Describe a position *)

open Js_of_ocaml
open Js 

class type position = object 
  method x : int readonly_prop
  method y : int readonly_prop
end

type t = position Js.t
