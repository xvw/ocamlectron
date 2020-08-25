open Js_of_ocaml
open Electron_main

let trace message = 
  message 
  |> Js.string 
  |> Electron_api.Tools.log 
  |> ignore

module My_app = Make.Basic_app(
  struct 
    let file = "./index.html"
    let main_window () = 
      Electron.make_browser_window 
        ~width:640 
        ~height:480 ()

    let init _electron _app _window = 
      trace "Hello World !"

    let exit = Some (0, fun i -> 
        trace "Bye !";
        Electron_api.Process.exit ~code:i ()
      ) 
  end
  )

let () = My_app.start ()
