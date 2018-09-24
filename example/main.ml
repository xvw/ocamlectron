open Electron_main

let () = 
  App.(on Ready (fun () -> 
      let win = 
        BrowserWindow.make 
          ~width:800 
          ~height:600 
          ()
      in 
      BrowserWindow.load_file win "index.html"; 
      BrowserWindow.(on win Closed (
          fun () -> 
            ignore (Common.Tools.log "foo"))
        )))

let () = 
  App.(on Quit (fun e i ->
      ignore (Common.Tools.log e);
      ignore (Common.Tools.log i)
    ))