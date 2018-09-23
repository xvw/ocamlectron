(** Binding for "event utils" *)

type event = Js.js_string Js.t

val make : string -> event
val on : 
  (#Binding.EventEmitter.emitter as 'a) Js.t 
  -> event 
  -> ('a Js.t -> unit) 
  -> unit