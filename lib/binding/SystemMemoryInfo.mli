(** Object giving memory usage statistics about the entire system. 
    Note that all statistics are reported in Kilobytes. 
*)

open Js 

class type system_memory_info = object 

  method total : int readonly_prop
  (** The total amount of physical memory in Kilobytes available to the system. *)

  method free : int readonly_prop
  (** The total amount of memory not being used by applications or disk cache. *)

  method swapTotal : int readonly_prop
  (** The total amount of swap memory in Kilobytes available to the system. 
      {b only Windows and Linux} 
  *)

  method swapFree : int readonly_prop
  (** The free amount of swap memory in Kilobytes available to the system. 
      {b only Windows and Linux} 
  *)

end

(** Main type *)
type t = system_memory_info Js.t