open Common
open Optional

let electron : Binding.ElectronMain.t = Electron.obj

type t = Binding.App.t
let app : t = electron ##. app

type _ event = 
  | Ready : (unit -> unit) event
  | WindowAllClosed : (unit -> unit) event
  | BeforeQuit : (unit -> unit) event 
  | WillQuit : (Binding.Event.t -> unit) event
  | Quit : (Binding.Event.t -> int -> unit) event
  | OpenFile : (Binding.Event.t -> Js.js_string Js.t -> unit) event
  | OpenUrl : (Binding.Event.t -> Js.js_string Js.t -> unit) event
  | Activate : (Binding.Event.t -> bool Js.t -> unit) event

let ev_to_string : type a. a event -> Js.js_string Js.t = function 
  | Ready -> Event.make "ready"
  | WindowAllClosed -> Event.make "window-all-closed"
  | BeforeQuit -> Event.make "before-quit"
  | WillQuit -> Event.make "will-quit"
  | Quit -> Event.make "quit"
  | OpenFile -> Event.make "open-file"
  | OpenUrl -> Event.make "open-url"
  | Activate -> Event.make "activate"

let on = 
  fun (event : 'a event) (f : 'a) ->
    let event_str = ev_to_string event in
    let callback = Js.wrap_callback f in 
    app ## on event_str callback

let once = 
  fun (event : 'a event) (f : 'a) ->
    let event_str = ev_to_string event in
    let callback = Js.wrap_callback f in 
    app ## once event_str callback

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

let quit () = 
  app ## quit ()

let exit ?code () = 
  let exit_code = Option.to_optdef code in 
  app ## exit exit_code

let relaunch () = 
  app ## relaunch (Optdef.empty)

let relaunch_with ~args ?exec_path () = 
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

let is_ready () = 
  let value = app ## isReady () in 
  Js.to_bool value

let focus () = app ## focus ()
let hide () = app ## hide () 
let show () = app ## show ()

let get_app_path () = 
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

let get_path path_name = 
  let path = path_to_string path_name in 
  let value = app ## getPath (Js.string path) in 
  Js.to_string value

let set_path path_name path = 
  let p = path_to_string path_name in 
  app ## setPath (Js.string p) (Js.string path)

let get_version () = 
  let v = app ## getVersion () in 
  Js.to_string v

let get_name () = 
  let v = app ## getName () in 
  Js.to_string v

let set_name new_name = 
  let name = Js.string new_name in 
  app ## setName name

let get_locale () = 
  let v = app ## getLocale () in 
  Js.to_string v

let add_recent_document path = 
  let v = Js.string path in 
  app ## addRecentDocument v

let clear_recent_documents () = 
  app ## clearRecentDocuments ()

let set_as_default_protocol_client_with ?path ?args protocol_name = 
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


let set_as_default_protocol_client protocol_name = 
  set_as_default_protocol_client_with protocol_name

let remove_as_default_protocol_client_with ?path ?args protocol_name = 
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

let remove_as_default_protocol_client protocol_name = 
  remove_as_default_protocol_client_with protocol_name

let is_default_protocol_client_with ?path ?args protocol_name = 
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

let is_default_protocol_client protocol_name = 
  is_default_protocol_client_with protocol_name


let set_user_tasks tasks = 
  let task_list = 
    tasks 
    |> List.map Binding.Struct.Task.to_object
    |> Array.of_list
    |> Js.array
  in 
  let result = app ## setUserTasks task_list in 
  Js.to_bool result


let make_single_instance f = 
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

let release_single_instance () =  app ## releaseSingleInstance ()
let disable_hardware_acceleration () = app ## disableHardwareAcceleration ()
let disable_domain_blocking_for_3D_apis () = 
  app ## disableDomainBlockingFor3DAPIS ()