module type BASIC_APP = 
sig
  val main_window : unit -> Electron_api.BrowserWindow.t
  val file : string
end


module Basic_app (F : BASIC_APP) : sig 
  val start : unit -> unit
end = struct 

  module Api = Electron_api 

  let window = ref Js.null
  let create_window () = 
    let () = window := Js.Opt.return (F.main_window ()) in 
    Js.Opt.case 
      !window
      (fun () -> ())
      (fun w -> 
         let open Api.BrowserWindow in
         load_file w F.file;
         on w Close (fun _ -> window := Js.null)
      )
  let start () =  
    let open Api.App in 
    let app = Electron.app in 
    on app Ready (fun _event -> create_window ()); 
    on app WindowAllClosed (fun _event ->
        if not Api.Os.(current () = Darwin) 
        then quit app
      ); 
    on app Activate (fun _ _ -> create_window ())
end