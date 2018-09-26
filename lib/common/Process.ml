open Optional
open Binding.Builtin

type t = Binding.Process.t

type process_kind = [ 
    `Browser 
  | `Renderer
  | `Unknown of string
]

type architecture = [
    `Arm 
  | `Arm64 
  | `Ia32 
  | `Mips 
  | `Mipsel 
  | `Ppc 
  | `Ppc64 
  | `S390
  | `S390x 
  | `X32
  | `X64
  | `Unknown of string
]
let process : t = Js.Unsafe.global##.process

let abort () = process ## abort ()

let allowed_node_environment_flags () =  
  let set = process ##. allowedNodeEnvironmentFlags in 
  let len = set ##. size in
  let arr = Array.make len "" in 
  let () = Set.iteri (fun i value -> arr.(i) <- Js.to_string value) set
  in arr

let extract_bool result = 
  Optdef.get result (fun () -> false)

let default_app () = extract_bool (process ##. defaultApp)

let resources_path () = 
  let result = process ##. resourcesPath in 
  Js.to_string result

let kind () = 
  let result = Js.to_string (process ##. _type) in 
  match result with 
  | "browser" -> `Browser
  | "renderer" -> `Renderer
  | x -> `Unknown x

let versions () = 
  let result = process ##. versions in 
  Binding.Struct.Versions.from_object result

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
  Binding.Struct.CPUUsage.from_object handler
let percent_cpu_usage () = 
  let handler = process ## getCPUUsage () in 
  handler ##. percentCPUUsage

let cpu_idle_wakeup () = 
  let handler = process ## getCPUUsage () in 
  handler ##. idleWakeupsPerSecond

let io_counters () = 
  let handler = process ## getIOCounters () in 
  Binding.Struct.IOCounters.from_object handler

let process_memory_info () = 
  let handler = process ## getProcessMemoryInfo () in 
  Binding.Struct.ProcessMemoryInfo.from_object handler

let system_memory_info () =  
  let handler = process ## getSystemMemoryInfo () in 
  Binding.Struct.SystemMemoryInfo.from_object handler

let memory_usage () = 
  let handler = process ## memoryUsage () in 
  Binding.Struct.MemoryUsage.from_object handler

let hang () = process ## hang ()
let set_fd_limit value = process ## setFdLimit (value)

let arch () = 
  let result = process ##. arch in
  match Js.to_string result with 
  | "arm" -> `Arm
  | "arm64" -> `Arm64 
  | "ia32" -> `Ia32
  | "mips" -> `Mips 
  | "mispel" -> `Mipsel
  | "ppc" -> `Ppc 
  | "ppc64" -> `Ppc64 
  | "s390" -> `S390 
  | "s390x" -> `S390x 
  | "x32" -> `X32
  | "x64" -> `X64
  | x -> `Unknown x

let argv () =  
  let raw_argv = process ##. argv in 
  raw_argv
  |> Js.to_array
  |> Array.map (Js.to_string)

let exec_argv () = 
  let raw_argv = process ##. execArgv in 
  raw_argv
  |> Js.to_array
  |> Array.map (Js.to_string)

let exec_path () = 
  let result = process ##. execPath in 
  Js.to_string result

let exit_code () = process ##. exitCode 
let set_exit_code code = process ##. exitCode := code

let exit ?code () = 
  match code with 
  | Some x -> process ## exit (Optdef.pure x)
  | None -> process ## exit (Optdef.pure (exit_code ()))

let argv0 () =  
  let raw_arg = process ##. argv0 in 
  Js.to_string raw_arg

let chdir dir = 
  let cdir = Js.string dir in 
  process ## chdir (cdir)

let cwd () =  
  let result = process ## cwd () in 
  Js.to_string result

let connected () = 
  let result = process ##. connected in 
  Js.to_bool result

let debug_port () = process ##. debugPort
let set_debug_port port = process ##.debugPort := port
let get_uid () = process ## getuid ()

let kill ?signal pid = 
  let sign = 
    Option.(signal >|= Signal.to_string >|= Js.string)
    |> Optdef.from_option
  in process ## kill pid sign

let pid () = process ##. pid
let ppid () = process ##. ppid
let platform = Os.current

let release () =  
  let handler = process ##. release in 
  Binding.Struct.Release.from_object handler