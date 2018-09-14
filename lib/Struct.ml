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