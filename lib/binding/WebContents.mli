(** Render and control web pages. 

    - {{: https://electronjs.org/docs/api/web-contents } Documentation for [WebContents]}
*)


open Js

class type web_contents = object 

  inherit EventEmitter.emitter

  method loadURL : js_string t -> unit meth
  method loadFile : js_string t -> unit meth 
  method downloadURL : js_string t -> unit meth
  method getURL : unit -> js_string t meth 
  method getTitle : unit -> js_string t meth 
  method isDestroyed : unit -> bool t meth 
  method focus : unit -> unit meth 
  method isFocused : unit -> bool t meth 
  method isLoading : unit -> bool t meth 
  method isLoadingMainFrame : unit -> bool t meth 
  method isWaitingForResponse : unit -> bool t meth 
  method stop : unit -> unit meth
  method reload : unit -> unit meth 
  method reloadIgnoringCache : unit -> unit meth 
  method canGoBack : unit -> bool t meth 
  method canGoForward : unit -> bool t meth 
  method canGoToOffset : int -> bool t meth 
  method clearHistory : unit -> unit meth
  method goBack : unit -> unit meth 
  method goForward : unit -> unit meth 
  method goToIndex : unit -> unit meth 
  method goToOffset : int -> unit meth 
  method isCrashed : unit -> bool t meth 
  method setUserAgent : js_string t -> unit meth 
  method getUserAgent : unit -> js_string t meth
  method insertCSS : js_string t -> unit meth 
  method setIgnoreMenuShortcuts : bool t -> unit meth 
  method setAudioMuted : bool t -> unit meth
  method isAudioMuted : unit -> bool t meth 
  method setZoomFactor : float -> unit meth
  method getZoomFactor : (float -> unit) callback -> unit meth
  method setZoomLevel : int -> unit meth
  method getZoomLevel : (int -> unit) callback -> unit meth

  method executeJavaScript : 
    js_string t 
    -> bool t Optdef.t 
    -> (unit -> 'a) callback Optdef.t 
    -> 'b Builtin.Promise.t meth
end

(** Main type *)
type t = web_contents Js.t