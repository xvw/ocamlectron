module Versions = 
struct 

  type t = {
    chrome : string 
  ; electron : string
  }

  let from_object obj = { 
    chrome   = Js.to_string (obj ##. chrome)
  ; electron = Js.to_string (obj ##. chrome)
  }

end

module CPUUsage = 
struct 

  type t = {
    percent_cpu_usage : int 
  ; idle_wakeups_per_second : int 
  }

  let from_object obj = { 
    percent_cpu_usage = obj ##. percentCPUUsage
  ; idle_wakeups_per_second = obj ##. idleWakeupsPerSecond
  }

end

module IOCounters = 
struct 

  type t = {
    read_operation_count  : int 
  ; write_operation_count : int 
  ; other_operation_count : int 
  ; read_transfer_count   : int 
  ; write_transfer_count  : int 
  ; other_transfer_count  : int
  }

  let from_object obj = 
    { read_operation_count = obj ##. readOperationCount
    ; write_operation_count = obj ##. writeOperationCount
    ; other_operation_count = obj ##. otherOperationCount
    ; read_transfer_count = obj ##. readTransferCount 
    ; write_transfer_count = obj ##. writeTransferCount 
    ; other_transfer_count = obj ##. otherTransferCount
    }

end

module ProcessMemoryInfo = 
struct 

  type t = {
    working_set_size : int 
  ; peak_working_set_size : int 
  ; private_bytes : int 
  ; shared_bytes : int 
  }

  let from_object obj = {
    working_set_size = obj ##. workingSetSize
  ; peak_working_set_size = obj ##. peakWorkingSetSize
  ; private_bytes = obj ##. privateBytes
  ; shared_bytes = obj ##. sharedBytes
  }

end

module SystemMemoryInfo =
struct 

  type t = {
    total : int 
  ; free : int 
  ; swap_total : int
  ; swap_free : int 
  }

  let from_object obj = {
    total = obj ##. total 
  ; free = obj ##. free 
  ; swap_total = obj ##. swapTotal
  ; swap_free = obj ##. swapFree
  }

end

module MemoryUsage = 
struct 

  type t = {
    rss : int 
  ; heap_total : int 
  ; heap_used : int 
  ; external_ : int
  }

  let from_object obj = {
    rss = obj ##. rss 
  ; heap_total = obj ##. heapTotal 
  ; heap_used = obj ##. heapUsed 
  ; external_ = obj ##. _external
  }

end

module Release =
struct 

  type lts = 
    | Argon
    | Boron
    | Carbon
    | Unknown of string

  type t = {
    name : string 
  ; source_url : string 
  ; headers_url : string 
  ; lib_url : string option
  ; lts : lts option
  }

  let lts_from_string = function 
    | "Argon" -> Argon 
    | "Boron" -> Boron 
    | "Carbon" -> Carbon
    | x -> Unknown x

  let from_object obj = {
    name = Js.to_string (obj ##. name)
  ; source_url = Js.to_string (obj ##. sourceUrl)
  ; headers_url = Js.to_string (obj ##. headersUrl)
  ; lib_url = Js.Optdef.(
      obj ##. libUrl 
      |> (fun x -> map x Js.to_string)
      |> to_option
    )
  ; lts = Js.Optdef.(
      obj ##. lts 
      |> (fun x -> map x Js.to_string)
      |> (fun x -> map x lts_from_string)
      |> to_option
    )
  }

end

module Task = 
struct 

  type t = {
    program : string 
  ; arguments : string
  ; title : string 
  ; description : string
  ; icon_path : string 
  ; icon_index : int 
  }

  let to_object task = 
    object%js 
      val program = Js.string task.program
      val arguments = Js.string task.arguments
      val title = Js.string task.title 
      val description = Js.string task.description
      val iconPath = Js.string task.icon_path 
      val iconIndex = task.icon_index
    end

  let from_object obj = {
    program = Js.to_string (obj ##. program)
  ; arguments = Js.to_string (obj ##. arguments)
  ; title = Js.to_string (obj ##. title)
  ; description = Js.to_string (obj ##. description)
  ; icon_path = Js.to_string (obj ##. iconPath)
  ; icon_index = obj ##. iconIndex
  }

end

module BrowserWindow =
struct

  type options = {
    width : int option
  ; height : int option
  ; x : int option
  ; y : int option
  ; use_content_size : bool option
  ; center : bool option
  ; min_width : int option
  ; min_height : int option
  ; max_width : int option
  ; resizable : bool option
  ; movable : bool option
  ; minimizable : bool option
  ; maximizable : bool option
  ; closable : bool option
  ; focusable : bool option
  ; always_on_top : bool option
  ; fullscreen : bool option
  ; fullscreenable : bool option 
  ; simple_fullscreen : bool option
  ; skip_taskbar : bool option
  ; kiosk : bool option
  ; title : string option
  ; show : bool option
  ; frame : bool option
  ; parent : BrowserWindow.t option
  ; modal : bool option
  ; accept_first_mouse : bool option
  ; disable_auto_hide_cursor : bool option
  ; auto_hide_menu_bar : bool option
  ; enable_larger_than_screen :  bool option
  ; background_color : string option
  ; has_shadow : bool option
  ; opacity : float option
  ; dark_theme : bool option
  ; transparent : bool option
  ; _type : string option
  ; title_bar_style : string option
  ; fullscreen_window_title : bool option
  ; thick_frame : bool option
  ; vibrancy : string option
  ; zoom_to_page_width : bool option
  ; tabbing_identifier : string option
  }


  let f g v = 
    let open Js.Optdef in 
    map (option v) g

  let id x = x

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
      ?title_bar_style
      ?fullscreen_window_title
      ?thick_frame
      ?vibrancy
      ?zoom_to_page_width
      ?tabbing_identifier
      () = 
    let options = object%js 
      val width = f id width
      val height = f id height
      val x = f fst position 
      val y = f snd position
      val useContentSize = f Js.bool use_content_size
      val center = f Js.bool center
      val minWidth = f id min_width
      val minHeight = f id min_height
      val maxWidth = f id max_width
      val maxHeight = f id max_height
      val resizable = f Js.bool resizable
      val movable = f Js.bool movable
      val minimizable = f Js.bool minimizable
      val maximizable = f Js.bool maximizable
      val closable = f Js.bool closable
      val focusable = f Js.bool focusable
      val alwaysOnTop = f Js.bool always_on_top
      val fullscreen = f Js.bool fullscreen
      val fullscreenable = f Js.bool fullscreenable
      val simpleFullscreen = f Js.bool simple_fullscreen
      val skipTaskbar = f Js.bool skip_taskbar
      val kiosk = f Js.bool kiosk
      val title = f Js.string title 
      val show = f Js.bool show
      val frame = f Js.bool frame
      val parent = f id parent
      val modal = f Js.bool modal 
      val acceptFirstMouse = f Js.bool accept_first_mouse
      val disableAutoHideCursor = f Js.bool disable_auto_hide_cursor
      val autoHideMenuBar = f Js.bool auto_hide_menu_bar
      val enableLargerThanScreen = f Js.bool enable_larger_than_screen
      val backgroundColor = f Js.string background_color
      val hasShadow = f Js.bool has_shadow
      val opacity = f id opacity
      val darkTheme = f Js.bool dark_theme
      val transparent = f Js.bool transparent
      val _type = f Js.string _type 
      val titleBarStyle = f Js.string title_bar_style
      val fullscreenWindowTitle = f Js.bool fullscreen_window_title
      val thickFrame = f Js.bool thick_frame
      val vibrancy = f Js.string vibrancy
      val zoomToPageWidth = f Js.bool zoom_to_page_width
      val tabbingIdentifier = f Js.string tabbing_identifier
    end in new%js BrowserWindow.constr options

end

module Size = 
struct 

  type t = {
    width : int
  ; height : int
  }

  let from_object obj = {
    width = obj ##. width
  ; height = obj ##. height
  }

  let to_object size = 
    object%js 
      val width = size.width
      val height = size.height
    end

end

module Rectangle = 
struct 

  type t = {
    x : int
  ; y : int
  ; width : int
  ; height : int
  }

  let from_object obj = {
    x = obj ##. x 
  ; y = obj ##. y
  ; width = obj ##. width
  ; height = obj ##. height
  }

  let to_object rectangle = 
    object%js 
      val x = rectangle.x 
      val y = rectangle.y
      val width = rectangle.width
      val height = rectangle.height
    end

end

module Position = 
struct 

  type t = {
    x : int
  ; y : int
  }

  let from_object obj = {
    x = obj ##. x 
  ; y = obj ##. y
  }

  let to_object position = 
    object%js 
      val x = position.x 
      val y = position.y
    end

end