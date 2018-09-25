(** This module is [Work in progress], his goal is to provides an LWT's API 
    for JavaScript event handlers.
*)

type 'a t
type listener_id = (unit -> unit)

val on : #Binding.EventEmitter.emitter Js.t -> ('a -> 'b) t -> ('a -> 'b) -> listener_id
val off : listener_id -> unit
val make : string -> ?use_capture:bool -> #Binding.EventEmitter.emitter Js.t -> ('a -> 'b) Lwt.t