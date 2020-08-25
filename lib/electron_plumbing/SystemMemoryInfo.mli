(** Object giving memory usage statistics about the entire system. 
    Note that all statistics are reported in Kilobytes. 
*)

open Js_of_ocaml
open Js 

class type system_memory_info = object 
  method total : int readonly_prop
  method free : int readonly_prop
  method swapTotal : int readonly_prop
  method swapFree : int readonly_prop
end

type t = system_memory_info Js.t
