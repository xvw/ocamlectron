open Optional

type t = Electron.app Js.t

type path_name = 
  | Home 
  | AppData 
  | UserData 
  | Temp 
  | Exe 
  | Module 
  | Desktop 
  | Documents 
  | Downloads 
  | Music 
  | Pictures
  | Videos
  | Logs
  | PepperFlashSystemPlugin

let quit app = 
  app ## quit ()

let exit ?code app = 
  let exit_code = Option.to_optdef code in 
  app ## exit exit_code

let relaunch app = 
  app ## relaunch (Optdef.empty)

let relaunch_with ~args ?exec_path app = 
  let a = Js.string args in 
  let path = 
    Js.string 
    |> Option.map exec_path
    |> Option.to_optdef
  in 
  let options = 
    object%js 
      val args = a
      val execPath = path
    end
  in app ## relaunch (Optdef.pure options)

let is_ready app = 
  let value = app ## isReady () in 
  Js.to_bool value

let focus app = app ## focus ()
let hide app = app ## hide () 
let show app = app ## show ()

let get_app_path app = 
  let path = app ## getAppPath () in 
  Js.to_string path

let path_to_string = function 
  | Home -> "home"
  | AppData -> "appData"
  | UserData ->"userData"
  | Temp -> "temp"
  | Exe -> "exe"
  | Module -> "module"
  | Desktop -> "desktop"
  | Documents -> "documents"
  | Downloads -> "downloads"
  | Music -> "music"
  | Pictures -> "pictures"
  | Videos -> "videos"
  | Logs -> "logs"
  | PepperFlashSystemPlugin -> "pepperFlashSystemPlugin"

let get_path app path_name = 
  let path = path_to_string path_name in 
  let value = app ## getPath (Js.string path) in 
  Js.to_string value