(** Functors to build Application with ease *)

(** {2 Signatures} *)

(** Required interface to build a basic app *)
module type BASIC_APP = 
sig
  val main_window : unit -> Electron_api.BrowserWindow.t
  (** A function to build the "main window" *)

  val file : string
  (** The boot file *)

end

(** {2 Functors} *)

(** Build a basic Mono Window app *)
module Basic_app (F : BASIC_APP) : sig 
  val start : unit -> unit 
end
