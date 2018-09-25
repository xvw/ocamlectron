open Electron_main
let log x = ignore (Common.Tools.log x)

let create_window _ _ = 
  let win = BrowserWindow.make  ~width:800 ~height:600 () in 
  log "foo";
  BrowserWindow.load_file win "index.html"; 
  BrowserWindow.(once win Closed (fun () -> log "foo")); 
  Lwt.return_unit

let quit_app _ _  = 
  log "bye bye";
  Lwt.return_unit

let () =  
  let open App.Lwt_events in
  Lwt_js_events.async_loop ready target create_window
  |> ignore

let () =  
  let open App.Lwt_events in
  Lwt_js_events.async_loop quit target quit_app
  |> ignore
