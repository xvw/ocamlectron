(** Data about process 's memorymemory usage statistics about the 
    current process. Note that all statistics are reported in Kilobytes  
*)

open Js 

class type process_memory_info = object 
  method workingSetSize : int readonly_prop
  method peakWorkingSetSize : int readonly_prop
  method privateBytes : int readonly_prop
  method sharedBytes : int readonly_prop
end

type t = process_memory_info Js.t