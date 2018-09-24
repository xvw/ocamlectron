(** Wrapper for Electron (Main process) *)

(** {2 Internals types} *)

type t = Binding.ElectronMain.t
val obj : t

(** {2 Constructors} *)

val browser_window : Constructor.browser_window
val browser_window_singleton : Constructor.browser_window_singleton


(** {2 Properties} *)

val app : App.t