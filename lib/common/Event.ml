type event = Js.js_string Js.t

let make str = Js.string str 

let on target event callback = 
  target ## on event (fun () -> callback target)

