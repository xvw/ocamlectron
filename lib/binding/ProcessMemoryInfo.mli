(** Data about process 's memorymemory usage statistics about the 
    current process. Note that all statistics are reported in Kilobytes  
*)

open Js 

class type process_memory_info = object 

  method workingSetSize : int readonly_prop
  (** The amount of memory currently pinned to actual physical RAM. *)

  method peakWorkingSetSize : int readonly_prop
  (** The maximum amount of memory that has ever been pinned to actual 
      physical RAM. 
  *)

  method privateBytes : int readonly_prop
  (** The amount of memory not shared by other processes, such as JS heap 
      or HTML content. 
  *)

  method sharedBytes : int readonly_prop
  (** The amount of memory shared between processes, typically memory consumed 
      by the Electron code itself. 
  *)

end

(** Main type *)
type t = process_memory_info Js.t