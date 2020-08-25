open Js_of_ocaml

class type kind = Electron_plumbing.WebContents.web_contents

module S = Electron_plumbing.Struct

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

let ignore_menu_shortcuts win = function 
  | `Ignore -> win ## setIgnoreMenuShortcuts (Js._true)
  | `Keep -> win ## setIgnoreMenuShortcuts (Js._false)

let audio win = function 
  | `Mute -> win ## setAudioMuted (Js._true)
  | `Enabled -> win ## setAudioMuted (Js._false)

let is_audio_muted win = Js.to_bool (win ## isAudioMuted ())
let zoom_factor win value = win ## setZoomFactor value
let zoom_factor_of win callback = win ## getZoomFactor (Js.wrap_callback callback)
let zoom_level win value = win ## setZoomLevel value
let zoom_level_of win callback = win ## getZoomLevel (Js.wrap_callback callback)
let visual_zoom_level_limits win min max = win ## setVisualZoomLevelLimits min max
let layout_zoom_level_limits win min max = win ## setLayoutZoomLevelLimits min max
let undo win = win ## undo ()
let redo win = win ## redo ()
let cut win = win ## cut () 
let copy win = win ## copy ()
let delete win = win ## delete () 
let select_all win = win ## selectAll () 
let unselect win = win ## unselect () 
let copy_image win x y = win ## copyImageAt x y 
let insert_text win txt = win ## insertText (s txt)

let replace ?(misspelling = false) win text = 
  let str = Js.string text in 
  if misspelling 
  then win ## replaceMisspelling str 
  else win ## replace str

let paste ?(match_style = false) win =
  if match_style
  then win ## pasteAndMatchStyle ()
  else win ## paste ()

let to_opt f x =
   Optional.Option.map x f 
   |> Js.Optdef.option 

let find_in 
  ?forward 
  ?find_next 
  ?match_case 
  ?word_start 
  ?capital_as_word_start
  win words = 
   let opts = object%js
    val forward = to_opt Js.bool forward
    val findNext = to_opt Js.bool find_next
    val matchCase = to_opt Js.bool match_case
    val wordStart = to_opt Js.bool word_start
    val medialCapitalAsWordStart = to_opt Js.bool capital_as_word_start
   end in win ## findInPage (Js.string words) (Js.Optdef.return opts)

let printers win =
  win ## getPrinters ()
  |> Tools.js_array_to_list
    (Electron_plumbing.Struct.PrinterInfo.from_object) 
  
  
let print ?silent ?background ?device ?callback win =
  let cb =
    to_opt
      (fun f -> Js.wrap_callback (fun x -> f (Js.to_bool x)))
      callback
  in
  let op = object%js
    val silent = to_opt Js.bool silent
    val printBackground = to_opt Js.bool background
    val deviceName = to_opt Js.string device
  end
  in win ## print op cb


let print_to_pdf
    ?margins
    ?page
    ?background
    ?only_selection
    ?landscape
    ~callback
    win =
  let m  =
    to_opt
      (function `Default -> 0 | `Nothing -> 1 | `Minimal -> 2)
      margins in
  let bg = to_opt Js.bool background in
  let os = to_opt Js.bool only_selection in
  let la = to_opt Js.bool landscape in
  let cb = Js.wrap_callback (fun a b -> callback a b) in
  let (a, b) = match page with
    | Some (`Format (w, h)) ->
      (Js.Optdef.empty, Js.Optdef.return (object%js
         val width = w
         val height = h
       end))
    | _ ->
      ((to_opt
        (function
          | `A3 -> Js.string "A3"
          | `A4 -> Js.string "A4"
          | `A5 -> Js.string "A5"
          | `Legal -> Js.string "Legal"
          | `Letter -> Js.string "Letter"
          | `Tabloid -> Js.string "Tabloid"
          | _ -> Js.string "unknow"
        ) page ),
       Js.Optdef.empty
      ) in
  let opt =
    match page with
    | Some (`Format _) ->
      `A (object%js
        val marginsType = m
        val pageSize = b
        val printBackground = bg
        val printSelectionOnly = os
        val landscape = la
      end)
    | _ ->
      `B (object%js
        val marginsType = m
        val pageSize = a
        val printBackground = bg
        val printSelectionOnly = os
        val landscape = la
      end)
  in
  match opt with
  | `A o -> win ## printToPDF_formatted o cb
  | `B o -> win ## printToPDF o cb


let has_service_worker win callback =
  let cb = Js.wrap_callback (fun x -> callback (Js.to_bool x)) in
  win ## hasServiceWorker cb


let add_workspace win path = win ## addWorkspace (Js.string path)
let remove_workspace win path = win ## removeWorkspace (Js.string path)

let open_devtools ?mode win =
  let m = to_opt (fun option ->
      let r = match option with
        | `Right -> "right"
        | `Bottom -> "bottom"
        | `Undocked -> "undocked"
        | `Detach -> "detach"
      in object%js
        val mode = Js.string r
      end
    ) mode
  in win ## openDevTools m

let close_devtools win = win ## closeDevTools ()
let devtools_opened win = Js.to_bool (win ## isDevToolsOpened ())
let devtools_focused win = Js.to_bool (win ## isDevToolsFocused ())
    
let toggle_devtools win =
  let () = win ## toggleDevTools () in
  devtools_opened win

let inspect_element win x y = win ## inspectElement x y
let inspect_service_worker win = win ## inspectServiceWorker ()


let enable_device_emulation
    ~screen_position
    ~screen_size
    ?(device_scale_factor=0)
    ~view_size
    ~view_position
    ?(scale=1.0)
    win =
  let size (w, h) = S.Size.(to_object {width=w; height=h}) in
  let sp = match screen_position with
    | `Mobile -> "mobile"
    | `Desktop -> "desktop"
  in
  let sz = screen_size |> size in
  let vs = view_size |> size in
  let vp =
    view_position
    |> (fun (x, y) ->
        object%js
          val x = x
          val y = y
        end
      )
  in
  let obj = object%js
    val screenPosition = Js.string sp
    val screenSize = sz
    val deviceScaleFactor = device_scale_factor
    val viewSize = vs
    val viewPosition = vp
    val scale = scale
  end
  in win ## enableDeviceEmulation obj


let disable_device_emulation win = win ## disableDeviceEmulation ()

let save_page ~path ~save_type ~callback win =
  let p = Js.string path in
  let st = match save_type with
    | `HTMLOnly -> "HTMLOnly"
    | `HTMLComplete -> "HTMLComplete"
    | `MHTML -> "MHTML"
  in
  let cb = Js.wrap_callback callback in
  (win ## savePage p (Js.string st) cb)
  |> Js.to_bool

let show_definition_for_selection win =
  win ## showDefinitionForSelection ()

let is_off_screen win =
  Js.to_bool (win ## isOffscreen ())

let start_painting win =
  win ## startPainting ()

let stop_painting win =
  win ## stopPainting ()

let is_painting win =
  Js.to_bool (win ## isPainting ())

let frame_rate win fps =
  win ## setFrameRate fps

let frame_rate_of win =
  win ## getFrameRate ()

let invalidate win =
  win ## invalidate ()

let id_of win =
  win ##. id

let os_process_id_of win =
  win ## getOSProcessId ()
