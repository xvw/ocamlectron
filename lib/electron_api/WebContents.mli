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

(** {2 methods} *)

val load_url : #kind Js.t -> string -> unit 
(** The url can be a remote address (e.g. http://) 
    or a path to a local HTML file using the file:// protocol. 
*)

val load_file : #kind Js.t -> string -> unit
(** Load a file in the web content. *)

val download_url : #kind Js.t -> string -> unit 
(** Initiates a download of the resource at url without navigating. 
    The will-download event of session will be triggered. 
*)

val url : #kind Js.t -> string 
(** The URL of the current web page. *)

val title : #kind Js.t -> string 
(** The title of the current web page. *)

val is_destroyed : #kind Js.t -> bool
(** Whether the web page is destroyed. *)

val focus : #kind Js.t -> unit 
(** Focuses the web page. *)

val is_focused : #kind Js.t -> bool 
(** Whether the web page is focused. *)

val is_loading : #kind Js.t -> bool
(** Whether web page is still loading resources. *)

val is_loading_main_frame : #kind Js.t -> bool 
(** Whether the main frame (and not just iframes or frames within it) 
    is still loading. 
*)

val is_waiting_for_response : #kind Js.t -> bool 
(** Whether the web page is waiting for a first-response from the main 
    resource of the page. 
*)

val stop : #kind Js.t -> unit 
(** Stops any pending navigation. *)

val reload : ?ignoring_cache:bool -> #kind Js.t -> unit 
(** Reloads the current web page. *)

val can_go_back : #kind Js.t -> bool
(** Whether the browser can go back to previous web page. *)

val can_go_forward : #kind Js.t -> bool 
(** Whether the browser can go forward to next web page. *)

val can_go_to_offset : #kind Js.t -> int -> bool
(** Whether the web page can go to offset. *)

val clear_history : #kind Js.t -> unit
(** Clears the navigation history. *)

val back : #kind Js.t -> unit 
(** Makes the browser go back a web page. *)

val forward : #kind Js.t -> unit 
(** Makes the browser go forward a web page. *)

val go_to_index : #kind Js.t -> int -> unit 
(** Navigates browser to the specified absolute web page index. *)

val go_to_offset : #kind Js.t -> int -> unit 
(** Navigates to the specified offset from the "current entry". *)

val is_crashed : #kind Js.t -> bool 
(** Whether the renderer process has crashed. *)

val user_agent : #kind Js.t -> string -> unit 
(** Overrides the user agent for this web page. *)

val user_agent_of : #kind Js.t -> string 
(** The user agent for this web page. *)

val insert_css : #kind Js.t -> string -> unit 
(** Injects CSS into the current web page. *)

val execute_javascript :
  ?user_gesture:bool 
  -> ?callback:('a -> 'b) 
  -> #kind Js.t 
  -> string
  -> 'c Electron_plumbing.Builtin.Promise.t
(** Evaluates code in page. *)

val ignore_menu_shortcuts : #kind Js.t -> [`Ignore | `Keep] -> unit
(** Ignore application menu shortcuts while this web contents is focused. *)

val audio : #kind Js.t -> [`Mute | `Enabled] -> unit
(** Mute the audio on the current web page. *)

val is_audio_muted : #kind Js.t -> bool
(** Whether this page has been muted. *)

val zoom_factor : #kind Js.t -> float -> unit 
(** Changes the zoom factor to the specified factor. Zoom factor is zoom 
    percent divided by 100, so 300% = 3.0. 
*)

val zoom_factor_of : #kind Js.t -> (float -> unit) -> unit
(** Sends a request to get current zoom factor, the callback will be 
    called with callback(zoomFactor).
*)

val zoom_level : #kind Js.t -> int -> unit 
(** Changes the zoom level to the specified level. The original size is 0 and each 
    increment above or below represents zooming 20% larger or smaller to default 
    limits of 300% and 50% of original size, respectively. The formula for this 
    is scale := 1.2 ^ level. 
*)

val zoom_level_of : #kind Js.t -> (int -> unit) -> unit 
(** Sends a request to get current zoom level, the callback will be called with 
    callback(zoomLevel). 
*)

val visual_zoom_level_limits : #kind Js.t -> int -> int -> unit
(** Sets the maximum and minimum pinch-to-zoom level. *)

val layout_zoom_level_limits : #kind Js.t -> int -> int -> unit
(** Sets the maximum and minimum pinch-to-zoom level. *)

val undo : #kind Js.t -> unit 
(** Executes the editing command undo in web page. *)

val redo : #kind Js.t -> unit 
(** Executes the editing command redo in web page. *)

val cut : #kind Js.t -> unit 
(** Executes the editing command cut in web page. *)

val copy : #kind Js.t -> unit 
(** Executes the editing command copy in web page. *)

val paste : ?match_style:bool -> #kind Js.t -> unit 
(** Executes the editing command paste in web page. *)

val copy_image : #kind Js.t -> int -> int -> unit 
(** Copy the image at the given position to the clipboard. *)

val delete : #kind Js.t -> unit 
(** Executes the editing command delete in web page. *)

val select_all : #kind Js.t -> unit 
(** Executes the editing command select_all in web page. *)

val unselect : #kind Js.t -> unit 
(** Executes the editing command unselect in web page. *)

val replace : ?misspelling:bool -> #kind Js.t -> string -> unit 
(** Executes the editing command replace in web page. *)

val insert_text : #kind Js.t -> string -> unit
(** Inserts text to the focused element. *)

val find_in : 
  ?forward:bool
  -> ?find_next:bool 
  -> ?match_case:bool
  -> ?word_start:bool
  -> ?capital_as_word_start:bool
  -> #kind Js.t
  -> string
  -> int
(** Starts a request to find all matches for the text in the web page. 
    The result of the request can be obtained by subscribing to 
    found-in-page event. 
*)

val printers : #kind Js.t -> Electron_plumbing.Struct.PrinterInfo.t list
(** Get the list of available printers *)

val print :
  ?silent:bool
  -> ?background:bool
  -> ?device:string
  -> ?callback:(bool -> unit)
  -> #kind Js.t
  -> unit
(** Prints window's web page. When silent is set to true, 
    Electron will pick the system's default printer if deviceName
    is empty and the default settings for printing. 
*)

val print_to_pdf :
  ?margins:[`Default | `Nothing | `Minimal]
  -> ?page:
    [
      `A3
    | `A4
    | `A5
    | `Legal
    | `Tabloid
    | `Letter
    | `Format of (int * int)
    ]
  -> ?background:bool
  -> ?only_selection:bool
  -> ?landscape:bool
  -> callback:(
      Electron_plumbing.Builtin.Error.t
      -> Electron_plumbing.Builtin.Buffer.t
      -> unit
    )
  -> #kind Js.t
  -> unit
(** Prints window's web page as PDF with Chromium's preview printing
    custom settings.
*)
