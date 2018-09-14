open Optional

type t = Binding.process Js.t

type process_kind = 
  | Browser 
  | Renderer
  | Unknown
let process = Js.Unsafe.global##.process

let extract_bool result = 
  Optdef.get result (fun () -> false)

let default_app () = extract_bool (process ##. defaultApp)

let resource_path () = 
  let result = process ##. resourcePath in 
  Js.to_string result

let kind () = 
  let result = Js.to_string (process ##. _type) in 
  match result with 
  | "browser" -> Browser
  | "renderer" -> Renderer
  | _ -> Unknown

let versions () = 
  let result = process ##. versions in 
  Struct.Versions.from_object result

let chrome_version () = 
  let result = process ##. versions ##. chrome in 
  Js.to_string result

let electron_version () = 
  let result = process ##. versions ##. electron in 
  Js.to_string result


let mas () = extract_bool (process ##. mas)
let windows_store () = extract_bool (process ##. windowsStore)

let enable_asar () = process ##. noAsar := Js._false
let disable_asar () = process ##. noAsar := Js._true
let asar_enabled () = 
  let result = process ##. noAsar in 
  not (Js.to_bool result)

let enable_deprecation_warning () = process ##. noDeprecation := Js._false
let disable_deprecation_warning () = process ##. noDeprecation := Js._true
let deprecation_warning_enabled () = 
  let result = process ##. noDeprecation in 
  not (Js.to_bool result)

let enable_throw_deprecation () = process ##. throwDeprecation := Js._true
let disable_throw_deprecation () = process ##. throwDeprecation := Js._false
let throw_deprecation_enabled () = 
  let result = process ##. throwDeprecation in 
  Js.to_bool result

let enable_trace_deprecation () = process ##. traceDeprecation := Js._true
let disable_trace_deprecation () = process ##. traceDeprecation := Js._false
let trace_deprecation_enabled () = 
  let result = process ##. traceDeprecation in 
  Js.to_bool result

let crash () = process ## crash ()

let cpu_usage () = 
  let handler = process ## getCPUUsage () in 
  Struct.CPUUsage.from_object handler
let percent_cpu_usage () = 
  let handler = process ## getCPUUsage () in 
  handler ##. percentCPUUsage

let cpu_idle_wakeup () = 
  let handler = process ## getCPUUsage () in 
  handler ##. idleWakeupsPerSecond

let io_counters () = 
  let handler = process ## getIOCounters () in 
  Struct.IOCounters.from_object handler

let process_memory_info () = 
  let handler = process ## getProcessMemoryInfo () in 
  Struct.ProcessMemoryInfo.from_object handler