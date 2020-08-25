open Js_of_ocaml

module EventEmitter = Electron_plumbing.EventEmitter

type 'a t = Js.js_string Js.t
type js =  Electron_plumbing.Event.t
type listener_id = (unit -> unit)

let on (source : #EventEmitter.emitter Js.t) (event : ('a -> 'b) t) (f : ('a -> 'b)) = 
  let callback = Js.wrap_callback f in 
  let () = source ## on event callback in 
  fun () -> source ## off event callback

let off f = f ()
let make_s : (string -> 'a t) = Js.string

let make_lwt event source = 
  let elt = ref Js.null in 
  let task, await = Lwt.task () in 
  let cancel () = Js.Opt.iter !elt off in 
  let () = Lwt.on_cancel task cancel in 
  let () = 
    elt := Js.some (
        on source event (fun ev -> 
            let () = cancel () in 
            Lwt.wakeup await ev
          )
      )
  in task

let make event = 
  fun ?use_capture source -> 
    match use_capture with 
    | _ -> make_lwt (make_s event) source

let prevent_default event = 
  event ## preventDefault ()
