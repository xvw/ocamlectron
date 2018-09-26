open Electron_main
module My_app = Make.Basic_app(
  struct 
    let file = "./index.html"
    let main_window () = 
      Electron.make_browser_window 
        ~width:640 
        ~height:480 ()
  end
  )

let () = My_app.start ()