(** Describe a Rectangle *)

open Js_of_ocaml

class type rectangle = object 
  inherit Size.size
  inherit Position.position
end

type t = rectangle Js.t
