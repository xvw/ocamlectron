open Js_of_ocaml

type t = Electron_plumbing.BrowserWindow.t
let singleton electron = electron ##. _BrowserWindow

type _ event = 
  | PageTitleUpdated : (Event.js -> Js.js_string Js.t -> unit) event
  | Close : (Event.js -> unit) event
  | Closed : (Event.js -> unit) event 
  | SessionEnd : (Event.js -> unit) event 
  | Unresponsive : (Event.js -> unit) event 
  | Responsive : (Event.js -> unit) event 
  | Blur : (Event.js -> unit) event 
  | Focus : (Event.js -> unit) event 
  | Show : (Event.js -> unit) event 
  | Hide : (Event.js -> unit) event 
  | ReadyToShow : (Event.js -> unit) event 
  | Maximize : (Event.js -> unit) event 
  | Unmaximize : (Event.js -> unit) event 
  | Minimize : (Event.js -> unit) event 
  | Restore : (Event.js -> unit) event 
  | Resize : (Event.js -> unit) event 
  | Move : (Event.js -> unit) event 
  | Moved : (Event.js -> unit) event 
  | EnterFullScreen : (Event.js -> unit) event 
  | LeaveFullScreen : (Event.js -> unit) event 
  | EnterHTMLFullScreen : (Event.js -> unit) event  
  | LeaveHTMLFullScreen : (Event.js -> unit) event 
  | AppCommand : (Event.js -> Js.js_string Js.t -> unit) event
  | ScrollTouchBegin : (Event.js -> unit) event 
  | ScrollTouchEnd : (Event.js -> unit) event 
  | ScrollTouchEdge : (Event.js -> unit) event 
  | Swipe : (Event.js -> Js.js_string Js.t -> unit) event

let ev_to_string : type a. a event -> Js.js_string Js.t = function 
  | PageTitleUpdated -> Js.string "page-title-updated"
  | Close -> Js.string "close"
  | Closed -> Js.string "closed"
  | SessionEnd -> Js.string "session-end"
  | Unresponsive -> Js.string "unresponsive"
  | Responsive -> Js.string "responsive"
  | Blur -> Js.string "blur"
  | Focus -> Js.string "focus"
  | Show -> Js.string "show"
  | Hide -> Js.string "hide"
  | ReadyToShow -> Js.string "ready-to-show"
  | Maximize -> Js.string "maximize"
  | Unmaximize -> Js.string "unmaximize"
  | Minimize -> Js.string "minimize"
  | Restore -> Js.string "restore"
  | Resize -> Js.string "resize"
  | Move -> Js.string "move"
  | Moved -> Js.string "moved"
  | EnterFullScreen -> Js.string "enter-full-screen"
  | LeaveFullScreen -> Js.string "leave-full-screen"
  | EnterHTMLFullScreen -> Js.string "enter-html-full-screen"
  | LeaveHTMLFullScreen -> Js.string "leave-html-full-screen"
  | AppCommand -> Js.string "app-command"
  | ScrollTouchBegin -> Js.string "scroll-touch-begin"
  | ScrollTouchEnd -> Js.string "scroll-touch-end"
  | ScrollTouchEdge -> Js.string "scroll-touch-edge"
  | Swipe -> Js.string "swipe"

let on = 
  fun (win : t) (event : 'a event) (f : 'a) ->
    let event_str = ev_to_string event in
    let callback = Js.wrap_callback f in 
    win ## on event_str callback

let once = 
  fun (win : t) (event : 'a event) (f : 'a) ->
    let event_str = ev_to_string event in
    let callback = Js.wrap_callback f in 
    win ## once event_str callback

type title_bar_style = 
  [ `Default 
  | `Hidden 
  | `HiddenInset
  | `CustomButtonOnHover
  ]

type vibrancy = 
  [ `AppearanceBased 
  | `Light 
  | `Dark 
  | `TitleBar 
  | `Selection
  | `Menu 
  | `Popover 
  | `Sidebar 
  | `MediumLight 
  | `UltraDark 
  ]

type level = 
  [ `Normal 
  | `Floating 
  | `TornOffMenu 
  | `ModalPanel
  | `MainMenu 
  | `Status 
  | `PopUpMenu 
  | `ScreenSaver 
  ]

let title_bar_style_to_string = function 
  | `Default -> "default"
  | `Hidden -> "hidden"
  | `HiddenInset -> "hiddenInset"
  | `CustomButtonOnHover -> "customButtonsOnHover"

let vibrancy_to_string = function 
  | `AppearanceBased -> "appearance-based"
  | `Light -> "light"
  | `Dark  -> "dark"
  | `TitleBar -> "titlebar"
  | `Selection -> "selection"
  | `Menu -> "menu"
  | `Popover  -> "popover"
  | `Sidebar  -> "sidebar"
  | `MediumLight -> "medium-light"
  | `UltraDark -> "ultra-dark"

let level_to_string = function 
  | `Normal -> "normal"
  | `Floating -> "floating"
  | `TornOffMenu -> "torn-off-menu"
  | `ModalPanel -> "modal-panel"
  | `MainMenu -> "main-menu"
  | `Status -> "status"
  | `PopUpMenu -> "pop-up-menu"
  | `ScreenSaver -> "screen-saver"

let make 
    ?width 
    ?height
    ?position
    ?use_content_size
    ?center
    ?min_width
    ?min_height
    ?max_width
    ?max_height
    ?resizable
    ?movable
    ?minimizable
    ?maximizable
    ?closable
    ?focusable
    ?always_on_top
    ?fullscreen
    ?fullscreenable 
    ?simple_fullscreen
    ?skip_taskbar
    ?kiosk
    ?title
    ?show
    ?frame
    ?parent
    ?modal
    ?accept_first_mouse
    ?disable_auto_hide_cursor
    ?auto_hide_menu_bar
    ?enable_larger_than_screen
    ?background_color
    ?has_shadow
    ?opacity
    ?dark_theme
    ?transparent
    ?_type
    ?(title_bar_style = `Default)
    ?fullscreen_window_title
    ?thick_frame
    ?(vibrancy = `AppearanceBased)
    ?zoom_to_page_width
    ?tabbing_identifier
    electron = 
  Electron_plumbing.Struct.BrowserWindow.make
    ?width 
    ?height
    ?position
    ?use_content_size
    ?center
    ?min_width
    ?min_height
    ?max_width
    ?max_height
    ?resizable
    ?movable
    ?minimizable
    ?maximizable
    ?closable
    ?focusable
    ?always_on_top
    ?fullscreen
    ?fullscreenable 
    ?simple_fullscreen
    ?skip_taskbar
    ?kiosk
    ?title
    ?show
    ?frame
    ?parent
    ?modal
    ?accept_first_mouse
    ?disable_auto_hide_cursor
    ?auto_hide_menu_bar
    ?enable_larger_than_screen
    ?background_color
    ?has_shadow
    ?opacity
    ?dark_theme
    ?transparent
    ?_type
    ~title_bar_style:(title_bar_style_to_string title_bar_style)
    ?fullscreen_window_title
    ?thick_frame
    ~vibrancy:(vibrancy_to_string vibrancy)
    ?zoom_to_page_width
    ?tabbing_identifier
    (electron ##. _BrowserWindow_fromOpts)

let all electron =  
  (singleton electron) ## getAllWindows ()
  |> Js.to_array
  |> Array.to_list

let focused electron =  
  (singleton electron) ## getFocusedWindow ()
  |> Js.Opt.to_option

let id win = win ##. id 
let destroy win = win ## destroy ()
let close win = win ## close ()
let focus win = win ## focus () 
let blur win = win ## blur ()
let is_focused win = Js.to_bool (win ## isFocused ())
let is_destroyed win = Js.to_bool (win ## isDestroyed ())
let hide win = win ## hide ()
let is_visible win = Js.to_bool (win ## isVisible ())
let is_modal win = Js.to_bool (win ## isModal ())
let maximize win = win ## maximize ()
let minimize win = win ## minimize ()
let is_maximized win = Js.to_bool (win ## isMaximized ())
let is_minimized win = Js.to_bool (win ## isMinimized ())
let restore win = win ## restore ()
let unmaximize win = win ## unmaximize ()

let show ?(focus=true) win = 
  if focus then win ## show () 
  else win ## showInactive ()

let fullscreen win value = win ## setFullscreen (Js.bool value)
let is_fullscreen win = Js.to_bool (win ## isFullscreen ())
let simple_fullscreen win value = win ## setSimpleFullscreen (Js.bool value)
let is_simple_fullscreen win = Js.to_bool (win ## isSimpleFullscreen ())

let aspect_ratio ?extra_size win ratio = 
  let open Optional.Option in 
  let size = 
    extra_size 
    >|= Electron_plumbing.Struct.Size.to_object 
    |> to_optdef 
  in win ## setAspectRatio ratio size

let close_preview win = win ## closeFilePreview ()
let preview_file ?display_name win path = 
  let open Optional.Option in 
  let name = display_name >|= Js.string |> to_optdef in 
  win ## previewFile (Js.string path) name

let bounds ?(animate = false) win rectangle = 
  let rect = Electron_plumbing.Struct.Rectangle.to_object rectangle in 
  let flag = Js.bool animate in 
  win ## setBounds rect (Js.Optdef.return flag)

let content_bounds ?(animate = false) win rectangle = 
  let rect = Electron_plumbing.Struct.Rectangle.to_object rectangle in 
  let flag = Js.bool animate in 
  win ## setContentBounds rect (Js.Optdef.return flag)

let bounds_of win = 
  (win ## getBounds ())
  |> Electron_plumbing.Struct.Rectangle.from_object

let content_bounds_of win = 
  (win ## getContentBounds ())
  |> Electron_plumbing.Struct.Rectangle.from_object

let enable win = win ## setEnabled (Js._true)
let disable win = win ## setEnabled (Js._false)

let resize ?(animate = false) win width height = 
  let flag = Js.Optdef.return (Js.bool animate) in 
  win ## setSize width height flag

let size_of win = 
  let open Electron_plumbing.Struct.Size in  
  let value = win ## getSize () in 
  match Js.to_array value with 
  | [|w; h|] -> {width = w; height = h}
  | _ -> {width = 0; height = 0}

let resize_content ?(animate = false) win width height = 
  let flag = Js.Optdef.return (Js.bool animate) in 
  win ## setContentSize width height flag

let content_size_of win = 
  let open Electron_plumbing.Struct.Size in  
  let value = win ## getContentSize () in 
  match Js.to_array value with 
  | [|w; h|] -> {width = w; height = h}
  | _ -> {width = 0; height = 0}

let maximum_size win w h = win ## setMaximumSize w h 
let minimum_size win w h = win ## setMinimumSize w h

let maximum_size_of win = 
  let open Electron_plumbing.Struct.Size in  
  let value = win ## getMaximumSize () in 
  match Js.to_array value with 
  | [|w; h|] -> {width = w; height = h}
  | _ -> {width = 0; height = 0}

let minimum_size_of win = 
  let open Electron_plumbing.Struct.Size in  
  let value = win ## getMinimumSize () in 
  match Js.to_array value with 
  | [|w; h|] -> {width = w; height = h}
  | _ -> {width = 0; height = 0}

let resizable win flag = win ## setResizable (Js.bool flag)
let is_resizable win = Js.to_bool (win ## isResizable ())
let movable win flag = win ## setMovable (Js.bool flag)
let is_movable win = Js.to_bool (win ## isMovable ())
let minimizable win flag = win ## setMinimizable (Js.bool flag)
let is_minimizable win = Js.to_bool (win ## isMinimizable ())
let maximizable win flag = win ## setMaximizable (Js.bool flag)
let is_maximizable win = Js.to_bool (win ## isMaximizable ())
let fullscreenable win flag = win ## setFullscreenable (Js.bool flag)
let is_fullscreenable win = Js.to_bool (win ## isFullscreenable ())
let closable win flag = win ## setClosable (Js.bool flag)
let is_closable win = Js.to_bool (win ## isClosable ())
let is_always_on_top win = Js.to_bool (win ## isAlwaysOnTop ())

let always_on_top ?(level = `Floating) ?(relative_level=0) win flag = 
  let l = Js.string (level_to_string level) in
  win ## setAlwaysOnTop 
    (Js.bool flag) 
    (Js.Optdef.return l) 
    (Js.Optdef.return relative_level)

let center win = win ## center ()

let position ?(animate = false) win x y = 
  let flag = Js.Optdef.return (Js.bool animate) in 
  win ## setPosition x y flag

let position_of win = 
  let open Electron_plumbing.Struct.Position in  
  let value = win ## getMinimumSize () in 
  match Js.to_array value with 
  | [|w; h|] -> {x = w; y = h}
  | _ -> {x = 0; y = 0}

let title win t = win ## setTitle (Js.string t)
let title_of win = Js.to_string (win ## getTitle ())

let sheet_offset ?offset_x win offset_y = 
  let offsetx = Js.Optdef.option offset_x in 
  win ## setSheetOffset offset_y offsetx

let start_flash_frame win = win ## flashFrame (Js._true)
let stop_flash_frame win = win ## flashFrame (Js._false)

let skip_taskbar win value = 
  let flag = Js.bool value in 
  win ## setSkipTaskbar flag

let kiosk win value = 
  let flag = Js.bool value in 
  win ## setKiosk flag

let is_kiosk win = 
  (win ## isKiosk ())
  |> Js.to_bool

let focus_webview win = win ## focusOnWebView ()
let blur_webview win = win ## blurWebView ()

let load_url win url = 
  let u = Js.string url in 
  win ## loadURL u

let load_file win file = load_url win (Tools.relativize file)

let reload win = win ## reload ()
let progressbar win value = win ## setProgressBar value
let shadow win value = win ## setHasShadow (Js.bool value)
let has_shadow win = Js.to_bool (win ## hasShadow ())
let opacity win value = win ## setOpacity (value)
let opacity_of win = win ## getOpacity ()

let parent win p = 
  let sp = Js.Opt.option p in 
  win ## setParentWindow sp

let parent_of win = 
  (win ## getParentWindow ())
  |> Js.Opt.to_option

let childs_of win = 
  (win ## getChildWindows ())
  |> Js.to_array
  |> Array.to_list

let web_contents win = 
  win ##. webContents
