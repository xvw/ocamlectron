(** Data about CPU usage *)

open Js 

class type cpu_usage = object 

  method percentCPUUsage : int readonly_prop
  (** Percentage of CPU used since the last call to getCPUUsage. 
      First call returns [0]. 
  *)

  method idleWakeupsPerSecond : int readonly_prop
  (** The number of average idle cpu wakeups per second since the 
      last call to getCPUUsage. First call returns [0]. Will always 
      return [0] on Windows. 
  *)
end

(** Main type *)
type t = cpu_usage Js.t