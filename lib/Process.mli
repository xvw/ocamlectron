(** The process object is a global that provides information about, 
    and control over, the current Node.js process.

    You can find more information on this page :

    - {{: https://nodejs.org/api/process.html }  NodeJS : documentation for [process] } 

    - {{: https://electronjs.org/docs/api/process }  ElectronJS : documentation for [process] } 
*)

(** {2 Internals types} *)

type t
(** An abstract version of [Binding.process] *)

(** {2 Objects} *)

val process : t
(** Reference the current process object *)

(** {2 Methods} *)

val default_app : unit -> bool
(** When app is started by being passed as parameter to the 
    default app, this property is [true] in the main process, 
    otherwise it is [false]. 
*)

val mas : unit -> bool 
(** For Mac App Store build, this property is [true], for other builds 
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

val resource_path : unit -> string
(** A [String] representing the path to the resources directory. *)