type t = Binding.BrowserWindow.t

type title_bar_style = 
  | Default 
  | Hidden 
  | HiddenInset
  | CustomButtonOnHover

type vibrancy = 
  | AppearanceBased 
  | Light 
  | Dark 
  | TitleBar 
  | Selection
  | Menu 
  | Popover 
  | Sidebar 
  | MediumLight 
  | UltraDark

let title_bar_style_to_string = function 
  | Default -> "default"
  | Hidden -> "hidden"
  | HiddenInset -> "hiddenInset"
  | CustomButtonOnHover -> "customButtonsOnHover"

let vibrancy_to_string = function 
  | AppearanceBased -> "appearance-based"
  | Light -> "light"
  | Dark  -> "dark"
  | TitleBar -> "titlebar"
  | Selection -> "selection"
  | Menu -> "menu"
  | Popover  -> "popover"
  | Sidebar  -> "sidebar"
  | MediumLight -> "medium-light"
  | UltraDark -> "ultra-dark"


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
    ?(title_bar_style = Default)
    ?fullscreen_window_title
    ?thick_frame
    ?(vibrancy = AppearanceBased)
    ?zoom_to_page_width
    ?tabbing_identifier
    () = 
  Binding.Struct.BrowserWindow.make
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
    ()