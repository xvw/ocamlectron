(** Data about CPU usage *)

open Js 

class type cpu_usage = object 

  method percentCPUUsage : int readonly_prop
  method idleWakeupsPerSecond : int readonly_prop
end

(** Main type *)
type t = cpu_usage Js.t