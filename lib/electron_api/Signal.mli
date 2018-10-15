(** Linux supports both [POSIX] reliable signals (hereinafter "standard
    signals") and POSIX real-time signals.

    You can find more information on this page :

    - {{: https://nodejs.org/api/process.html#process_signal_events }  NodeJS : documentation for [Signals] } 

    - {{: http://man7.org/linux/man-pages/man7/signal.7.html }  Linux Programmer's Manual on [Signals] } 
*)

(** {2 Internals types} *)

(** POSIX Signals *)
type t = 
  | SIGHUP 
  | SIGINT
  | SIGQUIT
  | SIGILL
  | SIGABRT
  | SIGFPE
  | SIGKILL
  | SIGSEGV
  | SIGPIPE 
  | SIGALRM
  | SIGTERM
  | SIGUSR1 
  | SIGUSR2 
  | SIGCHLD 
  | SIGSTOP 
  | SIGSTP 
  | SIGTTIN 
  | SIGTTOU 
  | SIGVTALRM
  | SIGXCPU
  | SIGXFSZ 
  | SIGWINCH 
  | SIGBREAK
  | SIGBUS

(** {2 Functions} *)

val to_string : t -> string
(** Converts signal to string *)