let browser_window = Main.Electron.browser_window 
let app = Main.Electron.app

open Common.Tools

let () = 
  Common.Event.(on app (make "ready") (fun _ -> 
      let win = Main.BrowserWindow.make 
          ~width:800 
          ~height:600
          browser_window 
      in 
      let () = on 
          win (make "closed") 
          (fun _ -> ignore (log "fin")) 
      in
      Main.BrowserWindow.load_url win (relativize "index.html")
    ))
