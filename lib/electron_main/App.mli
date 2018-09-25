(** Control your application's event lifecycle. 

    Wrap the behaviour of [Electron.app]

    You can find more information on this page :
    {{: https://electronjs.org/docs/api/app }  ElectronJS : documentation for [app] }
*)

(** {2 Internals types} *)

type t = Binding.App.t

val app : t

(** An alias of [Binding.Electron.app] *)

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


(** {2 Events} *)

type _ event = 
  | Ready : (unit -> unit) event
  | WindowAllClosed : (unit -> unit) event
  | BeforeQuit : (unit -> unit) event 
  | WillQuit : (Binding.Event.t -> unit) event
  | Quit : (Binding.Event.t -> int -> unit) event
  | OpenFile : (Binding.Event.t -> Js.js_string Js.t -> unit) event
  | OpenUrl : (Binding.Event.t -> Js.js_string Js.t -> unit) event
  | Activate : (Binding.Event.t -> bool Js.t -> unit) event

val on : ('a -> 'b) event -> ('a -> 'b) -> unit
val once : ('a -> 'b) event -> ('a -> 'b) -> unit

(** {3 Lwt Js events for [App.t]} *)

module Lwt_events : 
sig 
  val target : t
  val ready : ?use_capture:bool -> t -> (unit -> unit) Lwt.t
  val window_all_closed : ?use_capture:bool -> t -> (unit -> unit) Lwt.t
  val before_quit : ?use_capture:bool -> t -> (unit -> unit) Lwt.t
  val will_quit : ?use_capture:bool -> t -> (Binding.Event.t -> unit) Lwt.t
  val quit : ?use_capture:bool -> t -> (Binding.Event.t -> int -> unit) Lwt.t
  val open_file : ?use_capture:bool -> t -> (Binding.Event.t -> Js.js_string Js.t -> unit) Lwt.t
  val open_url : ?use_capture:bool -> t -> (Binding.Event.t -> Js.js_string Js.t -> unit) Lwt.t
  val activate : ?use_capture:bool -> t -> (Binding.Event.t -> bool Js.t -> unit) Lwt.t
end

(** {2 Methods} *)

val quit : unit -> unit
(** Try to close all windows. The [before-quit] event will be emitted first.
    If all windows are successfully closed, the [will-quit] event will be 
    emitted and by default the application will terminate. 
*)

val exit : ?code:int -> unit -> unit
(** Exits immediately with [code]. Default [code] is [0].
    All windows will be closed immediately without asking user and the 
    [before-quit] and [will-quit] events will not be emitted.
*)

val relaunch : unit -> unit 
(** Relaunches the app when current instance exits. 
    By default the new instance will use the same working directory and 
    command line arguments with current instance. 
*)

val relaunch_with : args:string -> ?exec_path:string -> unit -> unit 
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

val is_ready : unit -> bool
(** Returns [true] if Electron has finished initializing, [false]
    otherwise.
*)

val focus : unit -> unit 
(** On Linux, focuses on the first visible window. On macOS, makes the 
    application the active app. On Windows, focuses on the application's 
    first window. 
*)

val hide : unit -> unit 
(** {b only macOS}

    Hides all application windows without minimizing them.
*)

val show : unit -> unit 
(** {b only macOS}

    Shows application windows after they were hidden. Does not 
    automatically focus them.
*)

val get_app_path : unit -> string 
(** Returns the current application directory. *)

val get_path : path_name -> string
(** Returns a path to a special directory or file associated with name. *)

val set_path : path_name -> string -> unit
(** Overrides the path to a special directory or file associated with name. 
    If the path specifies a directory that does not exist, the directory 
    will be created by this method .
*)

val get_version : unit -> string
(** Returns the version of the loaded application. If no 
    version is found in the application's package.json file, the 
    version of the current bundle or executable is returned.
*)

val get_name : unit -> string 
(** Returns the current application's name, which is the name in 
    the application's package.json file 
*)

val set_name : string -> unit
(** Overrides the current application's name. *)

val get_locale : unit -> string
(** Returns the current application locale. *)

val add_recent_document : string -> unit 
(** {b only macOS and Windows}

    Adds [path] to the recent documents list.
*)

val clear_recent_documents : unit -> unit
(** {b only macOS and Windows}

    Clears the recent documents list.
*)

val set_as_default_protocol_client : string -> bool
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

val remove_as_default_protocol_client_with : 
  ?path:string 
  -> ?args:(string list)
  -> string 
  -> bool
(** {b only Windows}

    This method checks if the current executable as the default handler for a 
    protocol (aka URI scheme). If so, it will remove the app as 
    the default handler. 
*)

val remove_as_default_protocol_client : string -> bool
(** This method checks if the current executable as the default handler for a 
    protocol (aka URI scheme). If so, it will remove the app as 
    the default handler. 
*)

val is_default_protocol_client_with : 
  ?path:string 
  -> ?args:(string list)
  -> string 
  -> bool
(** {b only Windows}

    This method checks if the current executable is the default 
    handler for a protocol (aka URI scheme). 

    If so, it will return [true]. Otherwise, it will return [false]. 
*)

val is_default_protocol_client : string -> bool
(** This method checks if the current executable is the default 
    handler for a protocol (aka URI scheme). 

    If so, it will return [true]. Otherwise, it will return [false].  
*)

val set_user_tasks : Binding.Struct.Task.t list -> bool 
(** {b only Windows}

    Adds tasks to the Tasks category of the [JumpList] on Windows. 
*)

(** This method makes your application a Single Instance Application - 
    instead of allowing multiple instances of your app to run, this will 
    ensure that only a single instance of your app is running, and other 
    instances signal this instance and exit.

    [callback] will be called by the first instance with 
    [allback(argv, workingDirectory)] when a second instance has been executed. 

    [argv] is an Array of the second instance's command line arguments, and 
    [workingDirectory] is its current working directory. Usually applications 
    respond to this by making their primary window focused and non-minimized.

    The [callback] is guaranteed to be executed after the [ready] event 
    of [app] gets emitted.

    This method returns [false] if your process is the primary instance of 
    the application and your app should continue loading. And returns [true] 
    if your process has sent its parameters to another instance, and you 
    should immediately quit.

    On {b macOS} the system enforces single instance automatically when 
    users try to open a second instance of your app in Finder, and the 
    [open-file] and [open-url] events will be emitted for that. 
    However when users start your app in command line the system's 
    single instance mechanism will be bypassed and you have to use 
    this method to ensure single instance.
*)
val make_single_instance : (string list -> string -> unit) -> bool

val release_single_instance : unit -> unit 
(** Releases all locks that were created by [make_single_instance]. 
    This will allow multiple instances of the application to once again 
    run side by side. 
*)

val disable_hardware_acceleration : unit -> unit 
(** Disables hardware acceleration for current app.

    This method can only be called before app is ready. 
*)

val disable_domain_blocking_for_3D_apis : unit -> unit 
(** By default, Chromium disables 3D APIs (e.g. WebGL) until restart on a 
    per domain basis if the GPU processes crashes too frequently. 
    This function disables that behaviour.

    This method can only be called before app is ready.
*)
