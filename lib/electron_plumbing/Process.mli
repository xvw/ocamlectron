(** The process object is a global that provides information about, 
    and control over, the current Node.js process.

    You can find more information on this page :

    - {{: https://nodejs.org/api/process.html }  NodeJS : documentation for [process] } 

    - {{: https://electronjs.org/docs/api/process }  ElectronJS : documentation for [process] } 
*)

open Js

class type process = object

  method abort : unit -> unit meth
  method allowedNodeEnvironmentFlags : (js_string t) Builtin.Set.t readonly_prop
  method arch : (js_string t) readonly_prop
  method argv : (js_string t js_array t) readonly_prop
  method argv0 : js_string t readonly_prop
  method chdir : js_string t -> unit meth
  method cwd : unit -> (js_string t) meth
  method connected : (bool t) readonly_prop
  method debugPort : int prop
  method execArgv : (js_string t js_array t) readonly_prop
  method execPath : (js_string t) readonly_prop
  method exitCode : int prop
  method exit : int Optdef.t -> unit meth
  method getuid : unit -> int meth
  method kill : int -> (js_string t) Optdef.t -> unit meth
  method memoryUsage : unit -> MemoryUsage.t meth
  method platform : (js_string t) readonly_prop
  method pid : int readonly_prop
  method ppid : int readonly_prop
  method release : Release.t readonly_prop
  method defaultApp : (bool Optdef.t) readonly_prop
  method mas : (bool Optdef.t) readonly_prop
  method windowsStore : (bool Optdef.t) readonly_prop
  method noAsar : (bool t) prop
  method noDeprecation : (bool t) prop
  method resourcesPath : (js_string t) readonly_prop
  method throwDeprecation : (bool t) prop
  method traceDeprecation : (bool t) prop
  method traceProcessWarnings : (bool t) prop 
  method _type : (js_string t) readonly_prop
  method versions : Versions.t readonly_prop
  method crash : unit -> unit meth
  method getCPUUsage : unit -> CPUUsage.t meth
  method getIOCounters : unit -> IOCounters.t meth
  method getProcessMemoryInfo : unit -> (ProcessMemoryInfo.t) meth
  method getSystemMemoryInfo : unit -> (SystemMemoryInfo.t) meth
  method hang : unit -> unit meth
  method setFdLimit : int -> unit meth
end

(** Main type *)
type t = process Js.t