(** The process object is a global that provides information about, 
    and control over, the current Node.js process.

    You can find more information on this page :

    - {{: https://nodejs.org/api/process.html }  NodeJS : documentation for [process] } 

    - {{: https://electronjs.org/docs/api/process }  ElectronJS : documentation for [process] } 
*)

(** {2 Internals types} *)

type t = Binding.process Js.t
(** An alias of [Binding.process] *)

(** The current process type *)
type process_kind = 
  | Browser 
  | Renderer
  | Unknown_kind

(** Kind of Architecture *)
type architecture = 
  | Arm 
  | Arm64 
  | Ia32 
  | Mips 
  | Mipsel 
  | Ppc 
  | Ppc64 
  | S390
  | S390x 
  | X32
  | X64
  | Unknown_architecture

(** {2 Objects} *)

val process : t
(** Reference the current process object *)

(** {2 Methods} *)

val abort : unit -> unit 
(** causes the Node.js process to exit immediately and generate a core file. *)

val allowed_node_environment_flags : unit -> string array
(** Resolves node options flags *)

val arch : unit -> architecture
(** returns a string identifying the operating system CPU architecture 
    for which the Node.js binary was compiled 
*)

val argv : unit -> string array 
(** Returns [argv], the passed arguments array *)

val argv0 : unit -> string 
(**  a read-only copy of the original value of [argv[0]] passed 
     when Node.js starts. 
*)

val crash : unit -> unit 
(** Causes the main thread of the current process crash. *)

val hang : unit -> unit 
(** Causes the main thread of the current process hang. *)

val default_app : unit -> bool
(** When app is started by being passed as parameter to the 
    default app, this property is [true] in the main process, 
    otherwise it is [false]. 
*)

val resources_path : unit -> string
(** A [String] representing the path to the resources directory. *)

val kind : unit -> process_kind
(** The current process's type.*)

val versions : unit -> Struct.Versions.t
(** Get the versions object *)

val chrome_version : unit -> string 
(** Get the version of chrome *)

val electron_version : unit -> string 
(** Get the version of electron *)

val mas : unit -> bool 
(** For Mac App Store build, this property is [true], for other builds 
    it is [false]. 
*)

val windows_store : unit -> bool 
(** For Windows store build, this property is [true], for other builds 
    it is [false]. 
*)

val enable_asar : unit -> unit
(** Enable [asar] support *)

val disable_asar : unit -> unit 
(** Disable [asar] support *)

val asar_enabled : unit -> bool
(** Returns [true] if [asar] is supported, [false] otherwise *)

val enable_deprecation_warning : unit -> unit 
(** Enable [deprecation warning] *)

val disable_deprecation_warning : unit -> unit 
(** Disable [deprecation warning] *)

val deprecation_warning_enabled : unit -> bool
(** Returns [true] if [deprecation_warning] is enabled, [false] otherwise *)

val enable_throw_deprecation : unit -> unit 
(** Enable the throwing of error when deprecation *)

val disable_throw_deprecation : unit -> unit 
(** Disable the throwing of error when deprecation *)

val throw_deprecation_enabled : unit -> bool
(** Returns [true] if [throwing deprecation] is enabled, [false] otherwise *)

val enable_trace_deprecation : unit -> unit 
(** Enable tracing deprecation *)

val disable_trace_deprecation : unit -> unit 
(** Disable tracing deprecation *)

val trace_deprecation_enabled : unit -> bool
(** Returns [true] if [tracing deprecation] is enabled, [false] otherwise *)

val cpu_usage : unit -> Struct.CPUUsage.t
(** Get the [CPUUSage] object *)

val percent_cpu_usage : unit -> int 
(** Percentage of CPU used since the last call to getCPUUsage. 
    First call returns [0]. 
*)

val cpu_idle_wakeup : unit -> int 
(** The number of average idle cpu wakeups per second since 
    the last call to getCPUUsage. First call returns [0]. 
    Will always return [0] on Windows. 
*)

val io_counters : unit -> Struct.IOCounters.t
(** {b only Windows and Linux}

    Get the [IOCounters] object 
*)

val process_memory_info : unit -> Struct.ProcessMemoryInfo.t 
(** Returns an object giving memory usage statistics about the 
    current process. Note that all statistics are reported in Kilobytes. 
*)

val system_memory_info : unit -> Struct.SystemMemoryInfo.t
(** Returns an object giving memory usage statistics about the entire 
    system. Note that all statistics are reported in Kilobytes.
*)

val set_fd_limit : int -> unit 
(** Sets the file descriptor soft limit to maxDescriptors or the 
    OS hard limit, whichever is lower for the current process. 
*)