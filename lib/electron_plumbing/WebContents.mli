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
  method goToIndex : int -> unit meth 
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
  method setVisualZoomLevelLimits : int -> int -> unit meth 
  method setLayoutZoomLevelLimits : int -> int -> unit meth
  method undo : unit -> unit meth 
  method redo : unit -> unit meth
  method cut : unit -> unit meth 
  method copy : unit -> unit meth 
  method copyImageAt : int -> int -> unit meth 
  method paste : unit -> unit meth 
  method pasteAndMatchStyle : unit -> unit meth
  method delete : unit -> unit meth 
  method selectAll : unit -> unit meth 
  method unselect : unit -> unit meth 
  method replace : js_string t -> unit meth 
  method replaceMisspelling : js_string t -> unit meth
  method insertText : js_string t -> unit meth
  method stopFindInPage : js_string t -> unit meth 
  method hasServiceWorker : (bool t -> unit) callback -> unit meth 
  method unregisterServiceWorker : (bool t -> unit) callback -> unit meth
  method getPrinters : unit -> PrinterInfo.t js_array t meth
  method addWorkspace : js_string t -> unit meth 
  method removeWorkspace : js_string t -> unit meth 
  method setDevToolsWebContents : web_contents t -> unit meth 
  method openDevTools : < mode : js_string t > t Optdef.t -> unit meth 
  method closeDevTools : unit -> unit meth 
  method isDevToolsOpened : unit -> unit meth 
  method isDevToolsFocused : unit -> unit meth 
  method toggleDevTools : unit -> unit meth 
  method inspectElement : int -> int -> unit meth 
  method inspectServiceWorker : unit -> unit meth 
  method send : js_string t -> 'a meth
  method disableDeviceEmulation : unit -> unit meth
  method showDefinitionForSelection : unit -> unit meth
  method isOffScreen : unit -> bool t meth
  method startPainting : unit -> unit meth 
  method stopPainting : unit -> unit meth 
  method setFrameRate : int -> unit meth 
  method getFrameRate : unit -> int meth 
  method invalidate : unit -> unit meth
  method getWebRTCIHandlingPolicy : unit -> js_string t meth
  method setWebRTCIHandlingPolicy : js_string t -> unit meth
  method getOSProcessId : unit -> int meth
  method id : int readonly_prop

  method setSize : 
    <
      enableAutoSize : bool t Optdef.t readonly_prop
    ; normal : Size.t Optdef.t readonly_prop
    ; min : Size.t Optdef.t readonly_prop
    ; max : Size.t Optdef.t readonly_prop
    > t 
    -> unit meth

  method savePage : 
    js_string t 
    -> js_string t 
    -> (Builtin.Error.t -> unit) callback 
    -> unit meth

  (* method sendInputEvent : 
     < 
      _type : js_string t readonly_prop
     ; modifiers : js_string t js_array t readonly_prop
     > t 
     -> unit meth *)

  method enableDeviceEmulation :
    <
      screenPosition : js_string t readonly_prop
    ; screenSize : Size.t readonly_prop
    ; deviceScaleFactor : int readonly_prop
    ; viewSize : Size.t readonly_prop
    ; scale : float readonly_prop
    > t 
    -> unit meth

  method print : 
    <
      silent : bool t Optdef.t readonly_prop
    ; printBackground : bool t Optdef.t readonly_prop
    ; deviceName : js_string t Optdef.t readonly_prop
    > t
    -> (bool t -> unit) callback Optdef.t 
    -> unit meth


  method printToPDF : 
    <
      marginsType : int Optdef.t readonly_prop
    ; pageSize : js_string t Optdef.t readonly_prop
    ; printBackground : bool t Optdef.t readonly_prop
    ; printSelectionOnly : bool t Optdef.t readonly_prop
    ; landscape : bool t Optdef.t readonly_prop
    > t
    -> (Builtin.Error.t -> Builtin.Buffer.t -> unit) callback
    -> unit meth

  method printToPDF_formatted : 
    <
      marginsType : int Optdef.t readonly_prop
    ; pageSize :
        <width: int readonly_prop; height: int readonly_prop> t
          Optdef.t readonly_prop
    ; printBackground : bool t Optdef.t readonly_prop
    ; printSelectionOnly : bool t Optdef.t readonly_prop
    ; landscape : bool t Optdef.t readonly_prop
    > t
    -> (Builtin.Error.t -> Builtin.Buffer.t -> unit) callback
    -> unit meth


  method findInPage :
    js_string t 
    -> <
      forward : bool t Optdef.t readonly_prop
    ; findNext : bool t Optdef.t readonly_prop
    ; matchCase : bool t Optdef.t readonly_prop
    ; wordStart : bool t Optdef.t readonly_prop
    ; medialCapitalAsWordStart : bool t Optdef.t readonly_prop
    > t Optdef.t 
    -> int meth

  method executeJavaScript : 
    js_string t 
    -> bool t Optdef.t 
    -> ('a -> 'b) callback Optdef.t 
    -> 'c Builtin.Promise.t meth
end

(** Main type *)
type t = web_contents Js.t
