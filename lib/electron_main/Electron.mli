(** Wrapper for Electron (Main process) *)

(** {2 Internals types} *)

type t = Binding.ElectronMain.t
val obj : t


(** {2 Functors} 
    Functors to structure Electron Application
*)