open Optional

type t = Binding.electron_app Js.t

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

let set_path app path_name path = 
  let p = path_to_string path_name in 
  app ## setPath (Js.string p) (Js.string path)

let get_version app = 
  let v = app ## getVersion () in 
  Js.to_string v

let get_name app = 
  let v = app ## getName () in 
  Js.to_string v

let set_name app new_name = 
  let name = Js.string new_name in 
  app ## setName name

let get_locale app = 
  let v = app ## getLocale () in 
  Js.to_string v

let add_recent_document app path = 
  let v = Js.string path in 
  app ## addRecentDocument v

let clear_recent_documents app = 
  app ## clearRecentDocuments ()

let set_as_default_protocol_client_with ?path ?args app protocol_name = 
  let protocol = Js.string protocol_name in 
  let p = Option.(path >|= Js.string |> to_optdef) in 
  let a = Option.(
      args 
      >|= List.map Js.string 
      >|= Array.of_list
      >|= Js.array
      |> to_optdef
    ) 
  in 
  let result = app ## setAsDefaultProtocolClient protocol p a 
  in Js.to_bool result


let set_as_default_protocol_client app protocol_name = 
  set_as_default_protocol_client_with app protocol_name

let remove_as_default_protocol_client_with ?path ?args app protocol_name = 
  let protocol = Js.string protocol_name in 
  let p = Option.(path >|= Js.string |> to_optdef) in 
  let a = Option.(
      args 
      >|= List.map Js.string 
      >|= Array.of_list
      >|= Js.array
      |> to_optdef
    ) 
  in 
  let result = app ## removeAsDefaultProtocolClient protocol p a 
  in Js.to_bool result

let remove_as_default_protocol_client app protocol_name = 
  remove_as_default_protocol_client_with app protocol_name

let is_default_protocol_client_with ?path ?args app protocol_name = 
  let protocol = Js.string protocol_name in 
  let p = Option.(path >|= Js.string |> to_optdef) in 
  let a = Option.(
      args 
      >|= List.map Js.string 
      >|= Array.of_list
      >|= Js.array
      |> to_optdef
    ) 
  in 
  let result = app ## isDefaultProtocolClient protocol p a 
  in Js.to_bool result

let is_default_protocol_client app protocol_name = 
  is_default_protocol_client_with app protocol_name


let set_user_tasks app tasks = 
  let task_list = 
    tasks 
    |> List.map Struct.Task.to_object
    |> Array.of_list
    |> Js.array
  in 
  let result = app ## setUserTasks task_list in 
  Js.to_bool result


let make_single_instance app f = 
  let pre_f args workdir = 
    let wd = Js.to_string workdir in 
    let arguments = 
      let a = Js.to_array args in 
      let len = Array.length a in 
      List.init len (fun i -> Js.to_string a.(i)) 
    in f arguments wd
  in 
  let result = 
    app ## makeSingleInstance (Js.wrap_callback pre_f)
  in Js.to_bool result
