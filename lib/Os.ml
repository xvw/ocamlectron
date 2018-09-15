type t = 
  | Aix 
  | Darwin 
  | FreeBSD 
  | Linux 
  | OpenBSD 
  | SunOS 
  | Win32
  | Unknown of string

let to_string = function 
  | Aix -> "aix"
  | Darwin -> "darwin"
  | FreeBSD -> "freebsd"
  | Linux  -> "linux"
  | OpenBSD -> "openbsd"
  | SunOS -> "sunos"
  | Win32 -> "win32"
  | Unknown name -> name

let from_string = function 
  | "aix" -> Aix 
  | "darwin" -> Darwin
  | "freebsd" -> FreeBSD
  | "linux" -> Linux 
  | "openbsd" -> OpenBSD
  | "sunos" -> SunOS
  | "win32" -> Win32
  | x -> Unknown x

let current () =  
  let process = Js.Unsafe.global##._process in 
  let str = Js.to_string (process ##. platform) in 
  from_string str