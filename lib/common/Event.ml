type event = Js.js_string Js.t

let make str = Js.string str 

let on (target : #Binding.EventEmitter.emitter Js.t) event callback = 
  target ## on event (Js.wrap_callback (fun () -> callback target))

