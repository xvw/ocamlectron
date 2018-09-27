module type BASIC_APP = 
sig
  val main_window : unit -> Electron_api.BrowserWindow.t
  val file : string
  val init : Electron.t -> Electron_api.App.t -> Electron_api.BrowserWindow.t -> unit
  val exit : (int * (int -> unit)) option
end


module Basic_app (F : BASIC_APP) : sig 
  val start : unit -> unit
end = struct 

  module Api = Electron_api 

  let window = ref Js.null
  let create_window electron app = 
    let () = window := Js.Opt.return (F.main_window ()) in 
    Js.Opt.case 
      !window
      (fun () -> ())
      (fun w -> 
         let open Api.BrowserWindow in
         load_file w F.file;
         F.init electron app w;
         on w Close (fun _ -> window := Js.null)
      )
  let start () =  
    let open Api.App in 
    let app = Electron.app in 
    on app Ready (fun _event -> create_window Electron.obj app); 
    on app WindowAllClosed (fun _event ->
        match F.exit with 
        | None -> 
          if not Api.Os.(current () = Darwin) 
          then exit ~code:0 app
        | Some (code, callback) -> callback code
      ); 
    on app Activate (fun _ _ -> create_window Electron.obj app)
end