open Electron_main
let browser_window = Electron.browser_window 
let app = Electron.app

open Common.Tools

let () = 
  Common.Event.(on app (make "ready") (fun _ -> 
      let win = BrowserWindow.make 
          ~width:800 
          ~height:600
          browser_window 
      in 
      let () = on 
          win (make "closed") 
          (fun _ -> ignore (log (Js.string "fin"))) 
      in
      BrowserWindow.load_file win "index.html"
    ))