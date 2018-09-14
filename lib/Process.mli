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
  | Unknown

(** {2 Objects} *)

val process : t
(** Reference the current process object *)

(** {2 Accessor and mutator} *)

val default_app : unit -> bool
(** When app is started by being passed as parameter to the 
    default app, this property is [true] in the main process, 
    otherwise it is [false]. 
*)

val resource_path : unit -> string
(** A [String] representing the path to the resources directory. *)

val kind : unit -> process_kind
(** The current process's type.*)

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

(** {2 Methods} *)

val crash : unit -> unit 
(** Causes the main thread of the current process crash. *)

val cpu_usage : unit -> int 
(** Percentage of CPU used since the last call to getCPUUsage. 
    First call returns [0]. 
*)

val cpu_idle_wakeup : unit -> int 
(** The number of average idle cpu wakeups per second since 
    the last call to getCPUUsage. First call returns [0]. 
    Will always return [0] on Windows. 
*)