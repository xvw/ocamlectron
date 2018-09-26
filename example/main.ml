open Electron_main
module Api = Electron_api

let electron = Electron.obj

let log x = ignore (Api.Tools.log x)

let create_window _ _ = 
  let win = Api.BrowserWindow.make  ~width:800 ~height:600 electron in 
  log "foo";
  Api.BrowserWindow.load_file win "index.html"; 
  Api.BrowserWindow.(once win Closed (fun () -> log "foo")); 
  Lwt.return_unit

let quit_app _ _  = 
  log "bye bye";
  Lwt.return_unit

let () =  
  let open Api.App.Lwt_events in
  Lwt_js_events.async_loop ready Electron.app create_window
  |> ignore

let () =  
  let open Api.App.Lwt_events in
  Lwt_js_events.async_loop quit Electron.app quit_app
  |> ignore
