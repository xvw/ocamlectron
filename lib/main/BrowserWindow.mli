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

type level = 
  | Normal 
  | Floating 
  | TornOffMenu 
  | ModalPanel
  | MainMenu 
  | Status 
  | PopUpMenu 
  | ScreenSaver

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

val id : t -> int 
(** A Integer representing the unique ID of the window. *)

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

val preview_file : ?display_name:string -> t -> string -> unit
(** Uses Quick Look to preview a file at a given path. *)

val close_preview : t -> unit
(** Closes the currently open Quick Look panel. *)

val bounds : ?animate:bool -> t -> Binding.Struct.Rectangle.t -> unit
(** Resizes and moves the window to the supplied bounds. *)

val bounds_of : t -> Binding.Struct.Rectangle.t
(** Returns bounds rectangle *)

val content_bounds : ?animate:bool -> t -> Binding.Struct.Rectangle.t -> unit
(** Resizes and moves the window's client area (e.g. the web page) to 
    the supplied bounds. 
*)

val content_bounds_of : t -> Binding.Struct.Rectangle.t
(** Returns content's bounds rectangle *)

val enable : t -> unit 
(** Enable the window *)

val disable : t -> unit 
(** Disable the window *)

val resize : ?animate:bool -> t -> int -> int -> unit
(** Resize the window *)

val resize_content : ?animate:bool -> t -> int -> int -> unit
(** Resize the window's content *)

val size_of : t -> Binding.Struct.Size.t
(** Returns the size of a window *)

val content_size_of : t -> Binding.Struct.Size.t
(** Returns the size of a window *)

val maximum_size : t -> int -> int -> unit 
(** Set the maximum size of the window *)

val minimum_size : t -> int -> int -> unit 
(** Set the minimum size of the window *)

val maximum_size_of : t -> Binding.Struct.Size.t
(** Returns the maximum size of a window *)

val minimum_size_of : t -> Binding.Struct.Size.t
(** Returns the minimum size of a window *)

val resizable : t -> bool -> unit 
(** Set if a window is resizable. *)

val is_resizable : t -> bool
(** Returns true if a window is resizable. *)

val movable : t -> bool -> unit 
(** Set if a window is movable. *)

val is_movable : t -> bool 
(** Returns true if a window is movable. *)

val minimizable : t -> bool -> unit 
(** Set if a window is minimizable. *)

val is_minimizable : t -> bool 
(** Returns true if a window is minimizable. *)

val maximizable : t -> bool -> unit 
(** Set if a window is maximizable. *)

val is_maximizable : t -> bool 
(** Returns true if a window is maximizable. *)

val fullscreenable : t -> bool -> unit 
(** Set if a window is fullscreenable. *)

val is_fullscreenable : t -> bool 
(** Returns true if a window is fullscreenable. *)

val closable : t -> bool -> unit 
(** Set if a window is closable. *)

val is_closable : t -> bool 
(** Returns true if a window is closable. *)

val always_on_top : ?level:level -> ?relative_level:int -> t -> bool ->  unit 
(** Set if a window is always on top. *)

val is_always_on_top : t -> bool
(** Returns true if a window is always on top. *)

val center : t -> unit 
(** Center the window. *)

val position : ?animate:bool -> t -> int -> int -> unit
(** Moves window to a position  and y. *)

val position_of : t -> Binding.Struct.Position.t
(** Returns the position of the window. *)

val title : t -> string -> unit 
(** Changes the title of native window to title. *)

val title_of : t -> string
(** Returns the title of the native window. *)

val sheet_offset : ?offset_x:float -> t -> float -> unit 
(** Changes the attachment point for sheets on {b macOS}. 
    By default, sheets are attached just below the window frame, 
    but you may want to display them beneath a HTML-rendered toolbar. 
    For example: 
*)

val start_flash_frame : t -> unit 
(** Starts flashing the window to attract user's attention. *)

val stop_flash_frame : t -> unit 
(** Stops flashing the window to attract user's attention. *)

val skip_taskbar : t -> bool -> unit 
(** Makes the window not show in the taskbar. *)

val kiosk : t -> bool -> unit 
(** Enter or leave kiosk mode. *)

val is_kiosk : t -> bool
(** Returns if the window is in Kiosk mode. *)

val focus_webview : t -> unit 
(** Focus activity on webview of the window. *)

val blur_webview : t -> unit 
(** Blur activity on webview of the window.  *)

val load_url : t -> string -> unit 
(** The url can be a remote address (e.g. http://) 
    or a path to a local HTML file using the file:// protocol. 
*)

val load_file : t -> string -> unit 
(** Load a file in the web content. *)

val reload : t -> unit 
(** Reload the loaded file of the window. *)

val progressbar : t -> float -> unit 
(** Sets progress value in progress bar. Valid range is [0, 1.0]. *)