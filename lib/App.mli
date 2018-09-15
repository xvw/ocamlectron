(** Control your application's event lifecycle. 

    Wrap the behaviour of [Electron.app]

    You can find more information on this page :
    {{: https://electronjs.org/docs/api/app }  ElectronJS : documentation for [app] }
*)

(** {2 Internals types} *)

type t
(** An abstract version of [Binding.Electron.app] *)

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

val set_path : t -> path_name -> string -> unit
(** Overrides the path to a special directory or file associated with name. 
    If the path specifies a directory that does not exist, the directory 
    will be created by this method .
*)

val get_version : t -> string
(** Returns the version of the loaded application. If no 
    version is found in the application's package.json file, the 
    version of the current bundle or executable is returned.
*)

val get_name : t -> string 
(** Returns the current application's name, which is the name in 
    the application's package.json file 
*)

val set_name : t -> string -> unit
(** Overrides the current application's name. *)

val get_locale : t -> string
(** Returns the current application locale. *)

val add_recent_document : t -> string -> unit 
(** {b only macOS and Windows}

    Adds [path] to the recent documents list.
*)

val clear_recent_documents : t -> unit
(** {b only macOS and Windows}

    Clears the recent documents list.
*)

val set_as_default_protocol_client : t -> string -> bool
(** This method sets the current executable as the default handler for 
    a protocol (aka URI scheme). It allows you to integrate your app 
    deeper into the operating system. Once registered, all links with 
    [your-protocol://] will be opened with the current executable. 

    The whole link, including protocol, will be passed to your application 
    as a parameter.
*)

val set_as_default_protocol_client_with : 
  ?path:string 
  -> ?args:(string list)
  -> t 
  -> string 
  -> bool
(** {b only Windows}

    This method sets the current executable as the default handler for 
    a protocol (aka URI scheme). It allows you to integrate your app 
    deeper into the operating system. Once registered, all links with 
    [your-protocol://] will be opened with the current executable. 

    The whole link, including protocol, will be passed to your application 
    as a parameter.
*)