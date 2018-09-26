(** The process object is a global that provides information about, 
    and control over, the current Node.js process.

    You can find more information on this pages :

    - {{: https://nodejs.org/api/process.html }  NodeJS : documentation for [process] } 

    - {{: https://electronjs.org/docs/api/process }  ElectronJS : documentation for [process] } 
*)

(** {2 Internals types} *)

type t = Binding.Process.t
(** An alias of [Binding.process] *)

(** The current process type *)
type process_kind = [ 
    `Browser 
  | `Renderer
  | `Unknown of string
]

(** Kind of Architecture *)
type architecture = [
    `Arm 
  | `Arm64 
  | `Ia32 
  | `Mips 
  | `Mipsel 
  | `Ppc 
  | `Ppc64 
  | `S390
  | `S390x 
  | `X32
  | `X64
  | `Unknown of string
]

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

val chdir : string -> unit
(** changes the current working directory of the Node.js process or throws an 
    exception if doing so fails (for instance, if the specified directory does not 
    exist). 
*)

val cwd : unit -> string 
(** Returns the current working directory of the Node.js process. *)

val connected : unit -> bool 
(** [true] the Node.js process is spawned with an IPC channel, otherwise 
    [false].
*)

val debug_port : unit -> int 
(** The port used by Node.js's debugger when enabled. *)

val set_debug_port : int -> unit 
(** Set the debug port. *)

val exec_argv : unit -> string array
(** The process.execArgv property returns the set of Node.js-specific 
    command-line options passed when the Node.js process was launched. 
    These options do not appear in the array returned by the [process.argv]
    property, and do not include the Node.js executable, the name of 
    the script, or any options following the script name. 

    These options are useful in order to spawn child processes with 
    the same execution environment as the parent. 
*)

val exec_path : unit -> string 
(** Returns the absolute pathname of the executable that started the 
     Node.js process. 
*)

val exit_code : unit -> int 
(** A number which will be the process exit code, when the process either 
      exits gracefully, or is exited via [process.exit()] without 
      specifying a code.
*)

val set_exit_code : int -> unit 
(** Change the default [exit_code] value. *)

val exit : ?code:int -> unit -> unit
(** Terminate the process synchronously with an exit status of code. *)

val get_uid : unit -> int
(** Returns the numeric user identity of the process. *)

val kill : ?signal:Signal.t -> int -> unit
(** Method sends the signal to the process identified by pid. *)

val memory_usage : unit -> Binding.Struct.MemoryUsage.t
(** Returns an object describing the memory usage of the Node.js 
    process measured in bytes. 
*)

val pid : unit -> int
(** Returns the PID of the process. *)

val ppid : unit -> int
(** Returns the PID of the current parent process. *)

val platform : unit -> Os.t
(** Returns a string identifying the operating system platform on which
    the Node.js process is running.
*)

val release : unit -> Binding.Struct.Release.t
(** returns an [Object] containing metadata related to the current release,
    including URLs for the source tarball and headers-only tarball. 
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

val versions : unit -> Binding.Struct.Versions.t
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

val cpu_usage : unit -> Binding.Struct.CPUUsage.t
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

val io_counters : unit -> Binding.Struct.IOCounters.t
(** {b only Windows and Linux}

    Get the [IOCounters] object 
*)

val process_memory_info : unit -> Binding.Struct.ProcessMemoryInfo.t 
(** Returns an object giving memory usage statistics about the 
    current process. Note that all statistics are reported in Kilobytes. 
*)

val system_memory_info : unit -> Binding.Struct.SystemMemoryInfo.t
(** Returns an object giving memory usage statistics about the entire 
    system. Note that all statistics are reported in Kilobytes.
*)

val set_fd_limit : int -> unit 
(** Sets the file descriptor soft limit to maxDescriptors or the 
    OS hard limit, whichever is lower for the current process. 
*)