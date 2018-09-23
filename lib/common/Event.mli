(** Binding for "event utils" *)

type event = Js.js_string Js.t

val make : string -> event
val on : 
  #Binding.EventEmitter.emitter Js.t 
  -> event 
  -> (#Binding.EventEmitter.emitter Js.t -> unit) 
  -> unit