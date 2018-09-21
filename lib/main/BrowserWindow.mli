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
  Binding.BrowserWindow.constr -> 
  t

val all : Binding.BrowserWindow.singleton Js.t -> t list 
(** Returns all opened browser windows. *)

val are_focused : Binding.BrowserWindow.singleton Js.t -> t option
(** Returns the window that is focused in this application *)

(** {2 Methods} *)

val destroy : t -> unit 
(** Force closing the window, the unload and beforeunload event won't be 
    emitted for the web page, and close event will also not be emitted for 
    this window, but it guarantees the closed event will be emitted.
*)

val close : t -> unit 
(** Try to close the window. This has the same effect as a user manually clicking 
    the close button of the window. The web page may cancel the close though.
*)

val focus : t -> unit 
(** Focuses on the window. *)

val blur : t -> unit 
(** Removes focus from the window. *)

val is_focused : t -> bool 
(** Whether the window is focused. *)

val is_destroyed : t -> bool 
(** Whether the window is destroyed. *)

val show : ?focus:bool -> t -> unit 
(** Shows and gives focus to the window. *)

val hide : t -> unit 
(** Hides the window. *)

val is_visible : t -> bool 
(** Whether the window is visible to the user. *)

val is_modal : t -> bool 
(** Whether current window is a modal window. *)

val maximize : t -> unit 
(** Maximizes the window. This will also show (but not focus) 
    the window if it isn't being displayed already. 
*)

val unmaximize : t -> unit 
(** Unmaximizes the window. *)

val is_maximized : t -> bool 
(** Whether the window is maximized. *)

val minimize : t -> unit 
(** Minimizes the window. On some platforms the minimized 
    window will be shown in the Dock. 
*)

val restore : t -> unit 
(** Restores the window from minimized state to its previous state. *)

val is_minimized : t -> bool 
(** Whether the window is minimized. *)

val fullscreen : t -> bool -> unit 
(** Sets whether the window should be in fullscreen mode. *)

val is_fullscreen : t -> bool 
(** Whether the window is in fullscreen mode. *)

val simple_fullscreen : t -> bool -> unit
(** Enters or leaves simple fullscreen mode. {b only for MacOS} *)

val is_simple_fullscreen : t -> bool 
(** Whether the window is in simple (pre-Lion) fullscreen mode. {b only for MacOS} *)

val aspect_ratio : ?extra_size:Binding.Struct.Size.t -> t -> float -> unit
(** This will make a window maintain an aspect ratio.  *)