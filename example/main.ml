open Electron_main
let log x = ignore (Common.Tools.log x)

let create_window () = 
  let win = BrowserWindow.make  ~width:800 ~height:600 () in 
  BrowserWindow.load_file win "index.html"; 
  BrowserWindow.(on win Closed (fun () -> log "foo"))

let () =  App.(on Ready create_window)
let () =  App.(on Quit (fun e i -> log e; log i))