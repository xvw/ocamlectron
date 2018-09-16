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

>

(** Constructor for [BrowserWindow] *)
val constr : (options t -> browser_window Js.t) constr

(** Main type *)
type t = browser_window Js.t