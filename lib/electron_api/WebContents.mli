(** Render and control web pages. *)

(** {2 Types and interfaces} *)

class type kind = Electron_plumbing.WebContents.web_contents
(** Alias for "kind of WebContents" *)

(** {2 Events} *)

type _ event = 
  | DidFinishLoad : (unit -> unit) event
  | DidFailLoad : (
      Event.js 
      -> int 
      -> Js.js_string Js.t 
      -> Js.js_string 
      -> bool Js.t 
      -> int 
      -> int 
      -> unit) event
  | DidFrameFinishLoad : (
      Event.js 
      -> bool Js.t 
      -> int 
      -> int 
      -> unit) event
  | DidStartLoading : (Event.js -> unit) event 
  | DidStopLoading : (Event.js -> unit) event
  | DomReady : (Event.js -> unit) event
  | PageFaviconUpdated : (
      Event.js 
      -> Js.js_string Js.t Js.js_array Js.t 
      -> unit) event
  | NewWindow : (
      Event.js 
      -> Js.js_string Js.t 
      -> Js.js_string Js.t 
      -> Js.js_string Js.t 
      -> BrowserWindow.t 
      -> Js.js_string Js.t Js.js_array Js.t
      ->  Electron_plumbing.Referer.t
      -> unit) event
  | WillNavigate : (
      Event.js 
      -> Js.js_string Js.t 
      -> unit) event
  | DidStartNavigation : (
      Event.js 
      -> Js.js_string Js.t 
      -> unit) event
  | DidNavigate : (
      Event.js 
      -> Js.js_string Js.t 
      -> int 
      -> Js.js_string Js.t 
      -> unit
    ) event
  | DidFrameNavigate : (
      Event.js 
      -> Js.js_string Js.t 
      -> int 
      -> Js.js_string Js.t 
      -> bool Js.t 
      -> int 
      -> int 
      -> unit
    ) event
  | DidNavigateInPage : (
      Event.js 
      -> Js.js_string Js.t 
      -> bool Js.t 
      -> int 
      -> int 
      -> unit
    ) event
  | WillPreventUnload : (Event.js -> unit) event
  | Crashed : (Event.js -> bool Js.t -> unit) event
  | Unresponsive : (Event.js -> unit) event 
  | Responsive : (Event.js -> unit) event
  | PluginCrashed : (
      Event.js 
      -> Js.js_string Js.t 
      -> Js.js_string Js.t 
      -> unit) event
  | Destroyed : (Event.js -> unit) event
  | BeforeInputEvent : (
      Event.js 
      -> <
        _type : Js.js_string Js.t Js.readonly_prop
      ; key : Js.js_string Js.t Js.readonly_prop
      ; code : Js.js_string Js.t Js.readonly_prop
      ; isAutoRepeat : bool Js.t Js.readonly_prop
      ; shift : bool Js.t Js.readonly_prop
      ; control : bool Js.t Js.readonly_prop
      ; alt : bool Js.t Js.readonly_prop
      ; meta : bool Js.t Js.readonly_prop
      > Js.t
      -> unit) event
  | DevtoolsOpened : (Event.js -> unit) event
  | DevtoolsClosed : (Event.js -> unit) event
  | DevtoolsFocused : (Event.js -> unit) event 
  | FoundInPage : (
      Event.js 
      -> <
        requestId : int Js.readonly_prop
      ; activeMatchOrdinal : int Js.readonly_prop
      ; matches : int Js.readonly_prop
      ; finalUpdate : bool Js.t Js.readonly_prop
      > Js.t
      -> unit) event
  | MediaStartedPlaying : (Event.js -> unit) event
  | MediaPaused : (Event.js -> unit) event
  | DidChangeThemeColor : (
      Event.js 
      -> Js.js_string Js.t Js.Opt.t 
      -> unit) event
  | UpdateTargetUrl : (
      Event.js 
      -> Js.js_string Js.t Js.Opt.t 
      -> unit) event
  | ContextMenu : (
      Event.js
      -> <
        x : int Js.readonly_prop
      ; y : int Js.readonly_prop
      ; linkUrl : Js.js_string Js.t Js.readonly_prop
      ; linkText : Js.js_string Js.t Js.readonly_prop
      ; pageURL : Js.js_string Js.t Js.readonly_prop
      ; frameURL : Js.js_string Js.t Js.readonly_prop
      ; srcURL : Js.js_string Js.t Js.readonly_prop
      ; mediaType : Js.js_string Js.t Js.readonly_prop
      ; hasImageContents : bool Js.t Js.readonly_prop
      ; isEditable : bool Js.t Js.readonly_prop
      ; selectionText : Js.js_string Js.t Js.readonly_prop
      ; titleText : Js.js_string Js.t Js.readonly_prop
      ; misspelledWord : Js.js_string Js.t Js.readonly_prop
      ; frameCharset : Js.js_string Js.t Js.readonly_prop
      ; inputFieldType : Js.js_string Js.t Js.readonly_prop
      ; menuSourceType : Js.js_string Js.t Js.readonly_prop
      ; mediaFlags : <
          inError: bool Js.t Js.readonly_prop
        ; isPaused : bool Js.t Js.readonly_prop
        ; isMuted : bool Js.t Js.readonly_prop
        ; hasAudio : bool Js.t Js.readonly_prop
        ; isLooping : bool Js.t Js.readonly_prop
        ; isControlsVisible : bool Js.t Js.readonly_prop
        ; canToggleControls : bool Js.t Js.readonly_prop
        ; canRotate : bool Js.t Js.readonly_prop
        > Js.t Js.readonly_prop
      ; editFlags : <
          canUndo : bool Js.t Js.readonly_prop
        ; canRedo : bool Js.t Js.readonly_prop
        ; canCut : bool Js.t Js.readonly_prop 
        ; canCopy : bool Js.t Js.readonly_prop 
        ; canPast : bool Js.t Js.readonly_prop
        ; canDelete : bool Js.t Js.readonly_prop 
        ; canSelectAll : bool Js.t Js.readonly_prop
        > Js.t
      > Js.t 
      -> unit) event
  | ConsoleMessage : (
      Event.js 
      -> int 
      -> Js.js_string Js.t 
      -> int 
      -> Js.js_string Js.t 
      -> unit) event

val on : #kind Js.t -> ('a -> 'b) event -> ('a -> 'b) -> unit
val once : #kind Js.t -> ('a -> 'b) event -> ('a -> 'b) -> unit