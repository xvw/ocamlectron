(** Data about Operating System *)

(** {2 Internal types} *)

type t = 
  | Aix 
  | Darwin 
  | FreeBSD 
  | Linux 
  | OpenBSD 
  | SunOS 
  | Win32
  | Unknown of string

(** {2 Functions} *)

val current : unit -> t 
(** Returns a string identifying the operating system platform on which the Node.js 
    process is running. 
*)

val to_string : t -> string 
(** Converts OS Kind to string *)

val from_string : string -> t 
(** Converts string to Os kind *)