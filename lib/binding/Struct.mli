module Versions : 
sig 

  type t = {
    chrome : string 
  ; electron : string 
  }

  val from_object : Versions.t -> t
  (** Converts [Binding.versions] to [t] *)

end

module CPUUsage : 
sig 

  type t = {
    percent_cpu_usage : int 
  ; idle_wakeups_per_second : int 
  }

  val from_object : CPUUsage.t -> t

end

module IOCounters : 
sig 

  type t = {
    read_operation_count  : int 
  ; write_operation_count : int
  ; other_operation_count : int 
  ; read_transfer_count   : int
  ; write_transfer_count  : int 
  ; other_transfer_count  : int
  }

  val from_object : IOCounters.t -> t

end

module ProcessMemoryInfo : 
sig 

  type t = {
    working_set_size : int 
  ; peak_working_set_size : int 
  ; private_bytes : int 
  ; shared_bytes : int 
  }

  val from_object : ProcessMemoryInfo.t -> t 
end

module SystemMemoryInfo : 
sig 

  type t = {
    total : int 
  ; free : int 
  ; swap_total : int 
  ; swap_free : int
  }

  val from_object : SystemMemoryInfo.t -> t
end

module MemoryUsage : 
sig 

  type t = {
    rss : int 
  ; heap_total : int 
  ; heap_used : int 
  ; external_ : int
  }

  val from_object : MemoryUsage.t -> t
end

module Release : 
sig 

  type lts = 
    | Argon
    | Boron
    | Carbon
    | Unknown

  type t = {
    name : string
  ; source_url : string
  ; headers_url : string
  ; lib_url : string option
  ; lts : lts option
  }

  val lts_from_string : string -> lts
  val from_object : Release.t -> t
end

module Task : 
sig 

  type t = {
    program : string
  ; arguments : string
  ; title : string
  ; description : string
  ; icon_path : string 
  ; icon_index : int 
  }

  val to_object : t -> Task.t
  val from_object : Task.t -> t 
end

module BrowserWindow : 
sig 

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

  val make : 
    ?width:int -> 
    ?height:int ->
    ?position:(int * int) ->
    ?use_content_size:bool ->
    ?center:bool ->
    ?min_width:int ->
    ?min_height:int ->
    ?max_width:int ->
    ?max_height:int ->
    ?resizable:bool ->
    ?movable:bool ->
    ?minimizable:bool ->
    ?maximizable:bool ->
    ?closable:bool ->
    ?focusable:bool ->
    ?always_on_top:bool ->
    ?fullscreen:bool ->
    ?fullscreenable:bool -> 
    ?simple_fullscreen:bool ->
    ?skip_taskbar:bool ->
    ?kiosk:bool ->
    ?title:string ->
    ?show:bool ->
    ?frame:bool ->
    ?parent:BrowserWindow.t ->
    ?modal:bool ->
    ?accept_first_mouse:bool ->
    ?disable_auto_hide_cursor:bool ->
    ?auto_hide_menu_bar:bool ->
    ?enable_larger_than_screen: bool ->
    ?background_color:string ->
    ?has_shadow:bool ->
    ?opacity:float ->
    ?dark_theme:bool ->
    ?transparent:bool ->
    ?_type:string ->
    ?title_bar_style:string ->
    ?fullscreen_window_title:bool ->
    ?thick_frame:bool ->
    ?vibrancy:string ->
    ?zoom_to_page_width:bool ->
    ?tabbing_identifier:string ->
    BrowserWindow.constr -> 
    BrowserWindow.t

end

module Size : 
sig 

  type t = {
    width : int
  ; height : int
  }

  val from_object : Size.t -> t
  val to_object : t -> Size.t
end

module Position : 
sig 

  type t = {
    x : int
  ; y : int
  }

  val from_object : Position.t -> t
  val to_object : t -> Position.t
end

module Rectangle : 
sig 

  type t = {
    x : int
  ; y : int
  ; width : int
  ; height : int
  }

  val from_object : Rectangle.t -> t
  val to_object : t -> Rectangle.t
end