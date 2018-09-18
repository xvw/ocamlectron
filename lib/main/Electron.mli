(** Wrapper for Electron (Main process) *)

(** {2 Internals types} *)

type t = Binding.ElectronMain.t

(** {2 Constructors} *)

val browser_window : t -> Constructor.browser_window
val browser_window_singleton : t -> Constructor.browser_window_singleton


(** {2 Properties} *)

val app : t -> App.t