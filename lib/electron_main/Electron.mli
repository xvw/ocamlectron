(** Wrapper for Electron (Main process) *)

(** {2 Internals types} *)

type t = Electron_plumbing.ElectronMain.t
val obj : t

(** {2 Helpers} *)
val app : Electron_api.App.t

val make_browser_window :
  ?width:int -> 
  ?height:int ->
  ?position:(int * int) ->
  ?use_content_size:bool ->
  ?center:bool ->
  ?min_width:int ->
  ?min_height:int ->
  ?max_width:int ->
  ?max_height:int ->
  ?resizable:bool ->
  ?movable:bool ->
  ?minimizable:bool ->
  ?maximizable:bool ->
  ?closable:bool ->
  ?focusable:bool ->
  ?always_on_top:bool ->
  ?fullscreen:bool ->
  ?fullscreenable:bool -> 
  ?simple_fullscreen:bool ->
  ?skip_taskbar:bool ->
  ?kiosk:bool ->
  ?title:string ->
  ?show:bool ->
  ?frame:bool ->
  ?parent:Electron_api.BrowserWindow.t ->
  ?modal:bool ->
  ?accept_first_mouse:bool ->
  ?disable_auto_hide_cursor:bool ->
  ?auto_hide_menu_bar:bool ->
  ?enable_larger_than_screen: bool ->
  ?background_color:string ->
  ?has_shadow:bool ->
  ?opacity:float ->
  ?dark_theme:bool ->
  ?transparent:bool ->
  ?_type:string ->
  ?title_bar_style:Electron_api.BrowserWindow.title_bar_style ->
  ?fullscreen_window_title:bool ->
  ?thick_frame:bool ->
  ?vibrancy:Electron_api.BrowserWindow.vibrancy ->
  ?zoom_to_page_width:bool ->
  ?tabbing_identifier:string ->
  unit 
  -> Electron_api.BrowserWindow.t
