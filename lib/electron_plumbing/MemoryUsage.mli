(** Memory Usage *)

open Js_of_ocaml
open Js

class type memory_usage = object 
  method rss : int readonly_prop
  method heapTotal : int readonly_prop
  method heapUsed : int readonly_prop
  method _external : int readonly_prop
end

type t = memory_usage Js.t
