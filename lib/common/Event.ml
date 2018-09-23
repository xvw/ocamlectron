type event = Js.js_string Js.t

let make str = Js.string str 

let on (target : #Binding.EventEmitter.emitter Js.t) 
    (event : event) (callback : (#Binding.EventEmitter.emitter Js.t -> unit)) = 
  target ## on event (fun () -> callback target; ())
  |> ignore

