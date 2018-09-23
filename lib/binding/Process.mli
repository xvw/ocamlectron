(** The process object is a global that provides information about, 
    and control over, the current Node.js process.

    You can find more information on this page :

    - {{: https://nodejs.org/api/process.html }  NodeJS : documentation for [process] } 

    - {{: https://electronjs.org/docs/api/process }  ElectronJS : documentation for [process] } 
*)

open Js

class type process = object

  method abort : unit -> unit meth
  (** causes the Node.js process to exit immediately and generate a core file. *)

  method allowedNodeEnvironmentFlags : (js_string t) Builtin.Set.t readonly_prop
  (** Resolves node options flags *)

  method arch : (js_string t) readonly_prop
  (** returns a string identifying the operating system CPU architecture 
      for which the Node.js binary was compiled 
  *)

  method argv : (js_string t js_array t) readonly_prop
  (** Returns [argv], the passed arguments array *)

  method argv0 : js_string t readonly_prop
  (**  a read-only copy of the original value of [argv[0]] passed 
       when Node.js starts. 
  *)

  method chdir : js_string t -> unit meth
  (** changes the current working directory of the Node.js process or throws an 
      exception if doing so fails (for instance, if the specified directory does not 
      exist). 
  *)

  method cwd : unit -> (js_string t) meth
  (** Returns the current working directory of the Node.js process. *)

  method connected : (bool t) readonly_prop
  (** [true] the Node.js process is spawned with an IPC channel, otherwise 
      [false].
  *)

  method debugPort : int prop
  (** The port used by Node.js's debugger when enabled.  *)

  method execArgv : (js_string t js_array t) readonly_prop
  (** The process.execArgv property returns the set of Node.js-specific 
      command-line options passed when the Node.js process was launched. 
      These options do not appear in the array returned by the [process.argv]
      property, and do not include the Node.js executable, the name of 
      the script, or any options following the script name. 

      These options are useful in order to spawn child processes with 
      the same execution environment as the parent. 
  *)

  method execPath : (js_string t) readonly_prop
  (** Returns the absolute pathname of the executable that started the 
      Node.js process. 
  *)

  method exitCode : int prop
  (** A number which will be the process exit code, when the process either 
      exits gracefully, or is exited via [process.exit()] without 
      specifying a code.
  *)

  method exit : int Optdef.t -> unit meth
  (** Terminate the process synchronously with an exit status of code. *)

  method getuid : unit -> int meth
  (** Returns the numeric user identity of the process. *)

  method kill : int -> (js_string t) Optdef.t -> unit meth
  (** Method sends the [signal] to the process identified by [pid]. *)

  method memoryUsage : unit -> MemoryUsage.t meth
  (** returns an object describing the memory usage of the Node.js 
      process measured in bytes.
  *)

  method platform : (js_string t) readonly_prop
  (** Returns a string identifying the operating system platform on 
      which the Node.js process is running. 
  *)

  method pid : int readonly_prop
  (** Returns the PID of the process. *)

  method ppid : int readonly_prop
  (** Returns the PID of the current parent process. *)

  method release : Release.t readonly_prop
  (** returns an [Object] containing metadata related to the current release,
      including URLs for the source tarball and headers-only tarball. 
  *)

  method defaultApp : (bool Optdef.t) readonly_prop
  (** When app is started by being passed as parameter to the 
      default app, this property is [true] in the main process, 
      otherwise it is [undefined]. 
  *)

  method mas : (bool Optdef.t) readonly_prop
  (** For Mac App Store build, this property is [true], for other builds 
      it is undefined. 
  *)

  method windowsStore : (bool Optdef.t) readonly_prop
  (** For Windows Store build, this property is [true], for other builds 
      it is undefined. 
  *)

  method noAsar : (bool t) prop
  (** A [Boolean] that controls ASAR support inside your application. 
      Setting this to [true] will disable the support for [asar] archives in 
      Node's built-in modules. 
  *)

  method noDeprecation : (bool t) prop
  (** A [Boolean] that controls whether or not deprecation warnings are 
      printed to [stderr]. Setting this to true will silence deprecation 
      warnings. 

      This property is used instead of the [--no-deprecation] command line 
      flag. 
  *)

  method resourcesPath : (js_string t) readonly_prop
  (** A [String] representing the path to the resources directory. *)

  method throwDeprecation : (bool t) prop
  (** A [Boolean] that controls whether or not deprecation warnings will 
      be thrown as exceptions. Setting this to [true] will throw errors 
      for deprecations. 

      This property is used instead of the [--throw-deprecation] 
      command line flag. 
  *)

  method traceDeprecation : (bool t) prop
  (** A [Boolean] that controls whether or not deprecations printed 
      to stderr include their stack trace. Setting this to [true] will 
      print stack traces for deprecations. 

      This property is instead of the [--trace-deprecation] command 
      line flag. 
  *)

  method traceProcessWarnings : (bool t) prop 
  (** A [Boolean] that controls whether or not process warnings 
      printed to stderr include their stack trace. Setting this to [true] 
      will print stack traces for process warnings (including deprecations). 

      This property is instead of the [--trace-warnings] command line flag. 
  *)

  method _type : (js_string t) readonly_prop
  (** A [String] representing the current process's type, can be ["browser"]
      (i.e. main process) or ["renderer"].
  *)

  method versions : Versions.t readonly_prop
  (** Returns an object with versions labels. *)

  method crash : unit -> unit meth
  (** Causes the main thread of the current process crash. *)

  method getCPUUsage : unit -> CPUUsage.t meth
  (** Returns [cpu_usage] *)

  method getIOCounters : unit -> IOCounters.t meth
  (** {b only Windows and Linux}

      Returns [io_counters] 
  *)

  method getProcessMemoryInfo : unit -> (ProcessMemoryInfo.t) meth
  (** Returns an object giving memory usage statistics about the 
      current process. Note that all statistics are reported in Kilobytes.
  *)

  method getSystemMemoryInfo : unit -> (SystemMemoryInfo.t) meth
  (** Returns an object giving memory usage statistics about the entire system.
      Note that all statistics are reported in Kilobytes. *)

  method hang : unit -> unit meth
  (** Causes the main thread of the current process hang. *)

  method setFdLimit : int -> unit meth
  (** Sets the file descriptor soft limit to maxDescriptors or the OS 
      hard limit, whichever is lower for the current process. 
  *)

end

(** Main type *)
type t = process Js.t