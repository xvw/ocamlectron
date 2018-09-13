(** Control your application's event lifecycle. 

    Wrap the behaviour of [Electron.app]
*)

(** {2 Internals types} *)

type t
(** An abstract version of [Electron.app] *)

(** Presaved path_name *)
type path_name = 
  | Home      (** User's home directory *)
  | AppData   (** Per-user application data directory *)
  | UserData  (** The directory for storing your app's configuration files *)
  | Temp      (** Temporary directory *)
  | Exe       (** The current executable file *)
  | Module    (** The [libchromiumcontent] library *)
  | Desktop   (** The current user's Desktop directory *)
  | Documents (** Directory for a user's "My Documents" *)
  | Downloads (**  Directory for a user's downloads *)
  | Music     (** Directory for a user's music *)
  | Pictures  (** Directory for a user's pictures *)
  | Videos    (** Directory for a user's videos *) 
  | Logs      (** Directory for your app's log folder *)
  | PepperFlashSystemPlugin
  (** Full path to the system version of the Pepper Flash plugin. *)

(** {2 Methods} *)

val quit : t -> unit
(** Try to close all windows. The [before-quit] event will be emitted first.
    If all windows are successfully closed, the [will-quit] event will be 
    emitted and by default the application will terminate. 
*)

val exit : ?code:int -> t -> unit
(** Exits immediately with [code]. Default [code] is [0].
    All windows will be closed immediately without asking user and the 
    [before-quit] and [will-quit] events will not be emitted.
*)

val relaunch : t -> unit 
(** Relaunches the app when current instance exits. 
    By default the new instance will use the same working directory and 
    command line arguments with current instance. 
*)

val relaunch_with : args:string -> ?exec_path:string ->  t -> unit 
(** Relaunches the app when current instance exits. 
    By default the new instance will use the same working directory and 
    command line arguments with current instance. When [args] is specified,
    the args will be passed as command line arguments instead. When 
    [exec_path] is specified, the [exec_path] will be executed for relaunch 
    instead of current app.

    Note that this method does not quit the app when executed, you have 
    to call [quit app] or [exit app] after calling [relaunch app] 
    to make the app restart.

    When [relaunch app] is called for multiple times, multiple instances 
    will be started after current instance exited.
*)

val is_ready : t -> bool
(** Returns [true] if Electron has finished initializing, [false]
    otherwise.
*)

val focus : t -> unit 
(** On Linux, focuses on the first visible window. On macOS, makes the 
    application the active app. On Windows, focuses on the application's 
    first window. 
*)

val hide : t -> unit 
(** {b only macOS}

    Hides all application windows without minimizing them.
*)

val show : t -> unit 
(** {b only macOS}

    Shows application windows after they were hidden. Does not 
    automatically focus them.
*)

val get_app_path : t -> string 
(** Returns the current application directory. *)

val get_path : t -> path_name -> string
(** Returns a path to a special directory or file associated with name. *)