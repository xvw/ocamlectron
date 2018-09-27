class type kind = Electron_plumbing.WebContents.web_contents

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


let s = Js.string
let s' = Js.to_string

let ev_to_string : type a. a event -> Js.js_string Js.t = function 
  | DidFinishLoad -> s "did-finish-load"
  | DidFailLoad -> s "did-fail-load"
  | DidFrameFinishLoad -> s "did-frame-finish-load"
  | DidStartLoading -> s "did-start-loading"
  | DidStopLoading -> s "did-stop-loading"
  | DomReady -> s "dom-ready"
  | PageFaviconUpdated -> s "page-favicon-updated"
  | NewWindow -> s "new-window"
  | WillNavigate -> s "will-navigate"
  | DidStartNavigation -> s "did-start-navigation"
  | DidNavigate -> s "did-navigate"
  | DidFrameNavigate -> s "did-frame-navigate"
  | DidNavigateInPage -> s "did-navigate-in-page"
  | WillPreventUnload -> s "will-prevent-unload"
  | Crashed -> s "crashed"
  | Unresponsive -> s "unresponsive"
  | Responsive -> s "responsive"
  | PluginCrashed -> s "plugin-crashed"
  | Destroyed -> s "destroyed"
  | BeforeInputEvent -> s "before-input-event"
  | DevtoolsOpened -> s "devtools-opened"
  | DevtoolsClosed -> s "devtools-closed"
  | DevtoolsFocused -> s "devtools-focused"
  | FoundInPage -> s "found-in-page"
  | MediaStartedPlaying -> s "media-started-playing"
  | MediaPaused -> s "media-paused"
  | DidChangeThemeColor -> s "did-change-theme-color"
  | UpdateTargetUrl -> s "update-target-url"
  | ContextMenu -> s "context-menu"
  | ConsoleMessage -> s "console-message"

let on = 
  fun (webcontents : #kind Js.t) (event : 'a event) (f : 'a) ->
    let event_str = ev_to_string event in
    let callback = Js.wrap_callback f in 
    webcontents ## on event_str callback

let once = 
  fun (webcontents : #kind Js.t) (event : 'a event) (f : 'a) ->
    let event_str = ev_to_string event in
    let callback = Js.wrap_callback f in 
    webcontents ## once event_str callback

let load_url win url = win ## loadURL (s url)
let load_file win path = load_url win (Tools.relativize path)
let download_url win url = win ## downloadURL (s url)
let url win = s' (win ## getURL ())
let title win = s' (win ## getTitle ())
let is_destroyed win = Js.to_bool (win ## isDestroyed ())
let focus win = win ## focus ()
let is_focused win = Js.to_bool (win ## isFocused ())
let is_loading win = Js.to_bool (win ## isLoading ())
let is_loading_main_frame win = Js.to_bool (win ## isLoadingMainFrame ())
let is_waiting_for_response win = Js.to_bool (win ## isWaitingForResponse ())
let stop win = win ## stop () 

let reload ?(ignoring_cache = false) win =
  if ignoring_cache 
  then win ## reloadIgnoringCache () 
  else win ## reload ()

let can_go_back win = Js.to_bool (win ## canGoBack ())
let can_go_forward win = Js.to_bool (win ## canGoForward ())
let can_go_to_offset win offset = Js.to_bool (win ## canGoToOffset offset)
let clear_history win = win ## clearHistory ()
let back win = win ## goBack () 
let forward win = win ## goForward ()
let go_to_index win index = win ## goToIndex index 
let go_to_offset win offset = win ## goToOffset offset
let is_crashed win = Js.to_bool (win ## isCrashed ())
let user_agent win agent = (win ## setUserAgent (s agent))
let user_agent_of win = s' (win ## getUserAgent ())
let insert_css win css = (win ## insertCSS (s css))

let execute_javascript ?user_gesture ?callback (win : #kind Js.t) js = 
  let open Optional.Option in 
  let ug = user_gesture >|= Js.bool |> to_optdef in 
  let cb = callback >|= Js.wrap_callback |> to_optdef in 
  win ## executeJavaScript (s js) ug cb