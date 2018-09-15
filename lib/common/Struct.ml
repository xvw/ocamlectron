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
  ; lib_url = Optional.Optdef.(
      obj ##. libUrl 
      >|= Js.to_string 
      |> to_option
    )
  ; lts = Optional.Optdef.(
      obj ##. lts 
      >|= Js.to_string 
      >|= lts_from_string 
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