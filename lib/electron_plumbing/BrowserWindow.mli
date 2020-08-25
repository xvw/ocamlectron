(** Create and control browser windows. 

    - {{: https://electronjs.org/docs/api/browser-window } Documentation of [BrowserWindow]}
*)

open Js_of_ocaml
open Js

(** Define a windows  *)
class type browser_window = object
  inherit EventEmitter.emitter
  method id : int readonly_prop
  method destroy: unit -> unit meth 
  method close : unit -> unit meth
  method focus : unit -> unit meth 
  method blur : unit -> unit meth 
  method isFocused : unit -> bool t meth 
  method isDestroyed : unit -> bool t meth 
  method show : unit -> unit meth 
  method showInactive : unit -> unit meth
  method hide : unit -> unit meth 
  method isVisible : unit -> bool t meth 
  method isModal : unit -> bool t meth 
  method maximize : unit -> unit meth 
  method unmaximize : unit -> unit meth 
  method isMaximized : unit -> bool t meth 
  method minimize : unit -> unit meth 
  method restore : unit -> unit meth 
  method isMinimized : unit -> bool t meth 
  method setFullscreen : bool t -> unit meth 
  method isFullscreen : unit -> bool t meth 
  method setSimpleFullscreen : bool t -> unit meth 
  method isSimpleFullscreen : unit -> bool t meth 
  method setAspectRatio : float -> Size.t Optdef.t -> unit meth 
  method previewFile : js_string t -> js_string t Optdef.t -> unit meth 
  method closeFilePreview : unit -> unit meth 
  method setBounds : Rectangle.t -> bool t Optdef.t -> unit meth 
  method getBounds : unit -> Rectangle.t meth 
  method setContentBounds : Rectangle.t -> bool t Optdef.t -> unit meth 
  method getContentBounds : unit -> Rectangle.t meth 
  method setEnabled : bool t -> unit meth
  method setSize : int -> int -> bool t Optdef.t -> unit meth
  method getSize : unit -> int js_array t meth 
  method setContentSize : int -> int -> bool t Optdef.t -> unit meth
  method getContentSize : unit -> int js_array t meth
  method setMinimumSize : int -> int -> unit meth 
  method getMinimumSize : unit -> int js_array t meth 
  method setMaximumSize : int -> int -> unit meth 
  method getMaximumSize : unit -> int js_array t meth 
  method setResizable : bool t -> unit meth 
  method isResizable : unit -> bool t meth 
  method setMovable : bool t -> unit meth 
  method isMovable : unit -> bool t meth
  method setMinimizable : bool t -> unit meth
  method isMinimizable : unit -> bool t meth
  method setMaximizable : bool t -> unit meth
  method isMaximizable : unit -> bool t meth
  method setFullscreenable : bool t -> unit meth
  method isFullscreenable : unit -> bool t meth 
  method setClosable : bool t -> unit meth
  method isClosable : unit -> bool t meth
  method setAlwaysOnTop : bool t -> js_string t Optdef.t -> int Optdef.t -> unit meth
  method isAlwaysOnTop : unit -> bool t meth
  method center : unit -> unit meth
  method setPosition : int -> int -> bool t Optdef.t -> unit meth
  method getPosition : unit -> int js_array t meth 
  method setTitle : js_string t -> unit meth 
  method getTitle : unit -> js_string t meth
  method setSheetOffset : float -> float Optdef.t -> unit meth 
  method flashFrame : bool t -> unit meth 
  method setSkipTaskbar : bool t -> unit meth 
  method setKiosk : bool t -> unit meth 
  method isKiosk : unit -> bool t meth
  method focusOnWebView : unit -> unit meth 
  method blurWebView : unit -> unit meth 
  method loadURL : js_string t -> unit meth 
  method loadFile : js_string t -> unit meth
  method reload : unit -> unit meth
  method setProgressBar : float -> unit meth 
  method setHasShadow : bool t -> unit meth
  method hasShadow : unit -> bool t meth 
  method setOpacity : float -> unit meth
  method getOpacity : unit -> float meth 
  method setParentWindow : browser_window t Opt.t -> unit meth
  method getParentWindow : unit -> browser_window t Opt.t meth
  method getChildWindows : unit -> browser_window t js_array t meth
  method webContents : WebContents.t readonly_prop
end

(** Constructors parameters :

    - {{: https://electronjs.org/docs/api/browser-window#new-browserwindowoptions }  Documentations of options } 

*)
class type options = object
  method width : int Optdef.t readonly_prop
  method height : int Optdef.t readonly_prop
  method x : int Optdef.t readonly_prop
  method y : int Optdef.t readonly_prop
  method useContentSize : bool t Optdef.t readonly_prop
  method center : bool t Optdef.t readonly_prop
  method minWidth : int Optdef.t readonly_prop
  method minHeight : int Optdef.t readonly_prop
  method maxWidth : int Optdef.t readonly_prop
  method maxHeight : int Optdef.t readonly_prop
  method resizable : bool t Optdef.t readonly_prop
  method movable : bool t Optdef.t readonly_prop
  method minimizable : bool t Optdef.t readonly_prop
  method maximizable : bool t Optdef.t readonly_prop
  method closable : bool t Optdef.t readonly_prop
  method focusable : bool t Optdef.t readonly_prop
  method alwaysOnTop : bool t Optdef.t readonly_prop
  method fullscreen : bool t Optdef.t readonly_prop
  method fullscreenable : bool t Optdef.t readonly_prop 
  method simpleFullscreen : bool t Optdef.t readonly_prop
  method skipTaskbar : bool t Optdef.t readonly_prop
  method kiosk : bool t Optdef.t readonly_prop
  method title : js_string t Optdef.t readonly_prop
  method show : bool t Optdef.t readonly_prop
  method frame : bool t Optdef.t readonly_prop
  method parent : browser_window t Optdef.t readonly_prop
  method modal : bool t Optdef.t readonly_prop
  method acceptFirstMouse : bool t Optdef.t readonly_prop
  method disableAutoHideCursor : bool t Optdef.t readonly_prop
  method autoHideMenuBar : bool t Optdef.t readonly_prop
  method enableLargerThanScreen :  bool t Optdef.t readonly_prop
  method backgroundColor : js_string t Optdef.t readonly_prop
  method hasShadow : bool t Optdef.t readonly_prop
  method opacity : float Optdef.t readonly_prop
  method darkTheme : bool t Optdef.t readonly_prop
  method transparent : bool t Optdef.t readonly_prop
  method _type : js_string t Optdef.t readonly_prop
  method titleBarStyle : js_string t Optdef.t readonly_prop
  method fullscreenWindowTitle : bool t Optdef.t readonly_prop
  method thickFrame : bool t Optdef.t readonly_prop
  method vibrancy : js_string t Optdef.t readonly_prop
  method zoomToPageWidth : bool t Optdef.t readonly_prop
  method tabbingIdentifier : js_string t Optdef.t readonly_prop
end

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
