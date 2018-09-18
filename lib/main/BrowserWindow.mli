(** Create and control browser windows. 

    - {{: https://electronjs.org/docs/api/browser-window } Documentation of [BrowserWindow]}
*)

(** {2 Internals types} *)

type t = Binding.BrowserWindow.t

type title_bar_style = 
  | Default 
  | Hidden 
  | HiddenInset
  | CustomButtonOnHover

type vibrancy = 
  | AppearanceBased 
  | Light 
  | Dark 
  | TitleBar 
  | Selection
  | Menu 
  | Popover 
  | Sidebar 
  | MediumLight 
  | UltraDark


(** {2 Static Functions} *)

(** Constructor for [BrowserWindow] *)
val make : 
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
  ?parent:t ->
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
  ?title_bar_style:title_bar_style ->
  ?fullscreen_window_title:bool ->
  ?thick_frame:bool ->
  ?vibrancy:vibrancy ->
  ?zoom_to_page_width:bool ->
  ?tabbing_identifier:string ->
  unit -> 
  t

val all : unit -> t list 
(** Returns all opened browser windows. *)

val focused : unit -> t option
(** Returns the window that is focused in this application *)

(** {2 Methods} *)