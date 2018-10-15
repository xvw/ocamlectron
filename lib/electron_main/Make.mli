(** Functors to build Application with ease *)

(** {2 Signatures} *)

(** Required interface to build a basic app *)
module type BASIC_APP = 
sig
  val main_window : unit -> Electron_api.BrowserWindow.t
  (** A function to build the "main window" *)

  val file : string
  (** The boot file *)

  val init : Electron.t -> Electron_api.App.t -> Electron_api.BrowserWindow.t -> unit
  (** An initialize function (called when the app is ready and the window launched) *)

  val exit : (int * (int -> unit)) option
  (** Normal exit process, int is the [exitCode] *)

end

(** {2 Functors} *)

(** Build a basic Mono Window app *)
module Basic_app (F : BASIC_APP) : sig 
  val start : unit -> unit 
end
