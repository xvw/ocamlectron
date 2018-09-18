(** Create and control browser windows. 

    - {{: https://electronjs.org/docs/api/browser-window } Documentation of [BrowserWindow]}
*)

open Js

(** Constructors parameters :

    - {{: https://electronjs.org/docs/api/browser-window#new-browserwindowoptions }  Documentations of options } 

*)
type options = <
  width : int Optdef.t readonly_prop
; height : int Optdef.t readonly_prop
; x : int Optdef.t readonly_prop
; y : int Optdef.t readonly_prop
; useContentSize : bool t Optdef.t readonly_prop
; center : bool t Optdef.t readonly_prop
; minWidth : int Optdef.t readonly_prop
; minHeight : int Optdef.t readonly_prop
; maxWidth : int Optdef.t readonly_prop
; maxHeight : int Optdef.t readonly_prop
; resizable : bool t Optdef.t readonly_prop
; movable : bool t Optdef.t readonly_prop
; minimizable : bool t Optdef.t readonly_prop
; maximizable : bool t Optdef.t readonly_prop
; closable : bool t Optdef.t readonly_prop
; focusable : bool t Optdef.t readonly_prop
; alwaysOnTop : bool t Optdef.t readonly_prop
; fullscreen : bool t Optdef.t readonly_prop
; fullscreenable : bool t Optdef.t readonly_prop 
; simpleFullscreen : bool t Optdef.t readonly_prop
; skipTaskbar : bool t Optdef.t readonly_prop
; kiosk : bool t Optdef.t readonly_prop
; title : js_string t Optdef.t readonly_prop
; show : bool t Optdef.t readonly_prop
; frame : bool t Optdef.t readonly_prop
; parent : browser_window t Optdef.t readonly_prop
; modal : bool t Optdef.t readonly_prop
; acceptFirstMouse : bool t Optdef.t readonly_prop
; disableAutoHideCursor : bool t Optdef.t readonly_prop
; autoHideMenuBar : bool t Optdef.t readonly_prop
; enableLargerThanScreen :  bool t Optdef.t readonly_prop
; backgroundColor : js_string t Optdef.t readonly_prop
; hasShadow : bool t Optdef.t readonly_prop
; opacity : float Optdef.t readonly_prop
; darkTheme : bool t Optdef.t readonly_prop
; transparent : bool t Optdef.t readonly_prop
; _type : js_string t Optdef.t readonly_prop
; titleBarStyle : js_string t Optdef.t readonly_prop
; fullscreenWindowTitle : bool t Optdef.t readonly_prop
; thickFrame : bool t Optdef.t readonly_prop
; vibrancy : js_string t Optdef.t readonly_prop
; zoomToPageWidth : bool t Optdef.t readonly_prop
; tabbingIdentifier : js_string t Optdef.t readonly_prop
>

(** Define a windows  *)
and browser_window = <
  destroy: unit -> unit meth 
; close : unit -> unit meth
; focus : unit -> unit meth 
; blur : unit -> unit meth 
; isFocused : unit -> bool t meth 
; isDestroyed : unit -> bool t meth 
; show : unit -> unit meth 
; showInactive : unit -> unit meth
; hide : unit -> unit meth 
; isVisible : unit -> bool t meth 
; isModal : unit -> bool t meth 
; maximize : unit -> unit meth 
; unmaximize : unit -> unit meth 
; isMaximized : unit -> bool t meth 
; minimize : unit -> unit meth 
; restore : unit -> unit meth 
; isMinimized : unit -> bool t meth 
; setFullscreenFlag : bool t -> unit meth 
; isFullscreen : unit -> unit meth 
; setSimpleFullscreen : bool t -> unit meth 
; isSimpleFullscreen : unit -> bool t meth 
; setAspectRatio : float -> Size.t Optdef.t -> unit meth 
; previewFile : js_string t -> js_string t Optdef.t -> unit meth 
; closeFilePreview : unit -> unit meth 
; setBounds : Rectangle.t -> bool t Optdef.t -> unit meth 
; getBounds : unit -> Rectangle.t meth 
; setContentBounds : Rectangle.t -> bool t Optdef.t -> unit meth 
; getContentBounds : unit -> Rectangle.t meth 
; setEnabled : bool t -> unit meth
; setSize : int -> int -> bool t Optdef.t -> unit meth
; getSize : unit -> int js_array t meth 
; setContentSize : int -> int -> bool t Optdef.t -> unit meth
; getContentSize : unit -> int js_array t meth
; setMinimumSize : int -> int -> unit meth 
; getMinimumSize : unit -> int js_array t meth 
; setMaximumSize : int -> int -> unit meth 
; getMaximumSize : unit -> int js_array t meth 
; setResizable : bool t -> unit meth 
; isResizable : unit -> bool t meth 
; setMovable : bool t -> unit meth 
; isMovable : unit -> bool t meth
; setMinimizable : bool t -> unit meth
; isMinimizable : unit -> bool t meth
; setMaximizable : bool t -> unit meth
; isMaximizable : unit -> bool t meth
; setFullscreenable : bool t -> unit meth
; isFullscreenable : unit -> bool t meth 
; setClosable : bool t -> unit meth
; isClosable : unit -> bool t meth
; 
>

(** Singleton of [BrowserWindow] *)
class type singleton = object 

  method getAllWindows : unit -> browser_window t js_array t meth
  (** Returns all opened browser windows. *)

  method getFocusedWindow : unit -> (browser_window t) Opt.t meth
  (** Returns the window that is focused in this application *)

end


(** Main type *)
type t = browser_window Js.t
type constr = (options Js.t -> t) Js.constr