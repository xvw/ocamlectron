(** Control your application's event lifecycle.

    You can find more information on this page :
    {{: https://electronjs.org/docs/api/app }  ElectronJS : documentation for [app] }
*)

open Js 

class type app = object

  inherit EventEmitter.emitter

  method quit : unit -> unit meth
  (** Try to close all windows. The [before-quit] event will be emitted first.
      If all windows are successfully closed, the [will-quit] event will be
      emitted and by default the application will terminate.
  *)

  method exit : int Optdef.t -> unit meth
  (** Exits immediately with [exitCode]. Default [exitCode] is [0].
      All windows will be closed immediately without asking user and the
      [before-quit] and [will-quit] events will not be emitted.
  *)

  method relaunch : <
    args: js_string t readonly_prop; 
    execPath : js_string t Optdef.t readonly_prop
  > t Optdef.t -> unit meth
  (** Relaunches the app when current instance exits.
      By default the new instance will use the same working directory and
      command line arguments with current instance. When [args] is specified,
      the args will be passed as command line arguments instead. When
      [execPath] is specified, the [execPath] will be executed for relaunch
      instead of current app.

      Note that this method does not quit the app when executed, you have
      to call [app.quit] or [app.exit] after calling [app.relaunch]
      to make the app restart.

      When [app.relaunch] is called for multiple times, multiple instances
      will be started after current instance exited.
  *)

  method isReady : unit -> (bool t) meth
  (** Returns [true] if Electron has finished initializing, [false]
      otherwise.
  *)

  method focus : unit -> unit meth
  (** On Linux, focuses on the first visible window. On macOS, makes the
      application the active app. On Windows, focuses on the application's
      first window.
  *)

  method hide : unit -> unit meth
  (** {b only macOS}

      Hides all application windows without minimizing them.
  *)

  method show : unit -> unit meth
  (** {b only macOS}

      Shows application windows after they were hidden. Does not
      automatically focus them.
  *)

  method getAppPath : unit -> (js_string t) meth
  (** Returns the current application directory. *)


  method getPath : js_string t -> (js_string t) meth
  (** Returns a path to a special directory or file associated with name.
      On failure an Error is thrown.
  *)

  method setPath : js_string t -> js_string t -> unit meth
  (** Overrides the path to a special directory or file associated with name.
      If the path specifies a directory that does not exist, the directory
      will be created by this method
  *)

  method getVersion : unit -> (js_string t) meth
  (** Returns the version of the loaded application. If no
      version is found in the application's package.json file, the
      version of the current bundle or executable is returned.
  *)

  method getName : unit -> (js_string t) meth
  (** Returns the current application's name, which is the name in
      the application's package.json file
  *)

  method setName : js_string t -> unit meth
  (** Overrides the current application's name. *)

  method getLocale : unit -> (js_string t) meth
  (** Returns the current application locale. *)

  method addRecentDocument : js_string t -> unit meth
  (** {b only macOS and Windows}

      Adds [path] to the recent documents list.
  *)

  method clearRecentDocuments : unit -> unit meth
  (** {b only macOS and Windows}

      Clears the recent documents list.
  *)

  method setAsDefaultProtocolClient :
    js_string t
    -> (js_string t) Optdef.t
    -> ((js_string t) js_array t) Optdef.t
    -> (bool t) meth
  (** This method sets the current executable as the default handler for
      a protocol (aka URI scheme). It allows you to integrate your app
      deeper into the operating system. Once registered, all links with
      [your-protocol://] will be opened with the current executable.

      The whole link, including protocol, will be passed to your application
      as a parameter.
  *)

  method removeAsDefaultProtocolClient : 
    js_string t 
    -> (js_string t) Optdef.t
    -> ((js_string t) js_array t) Optdef.t
    -> (bool t) meth
  (** This method checks if the current executable as the default handler for a 
      protocol (aka URI scheme). If so, it will remove the app as 
      the default handler. 
  *)

  method isDefaultProtocolClient : 
    js_string t 
    -> (js_string t) Optdef.t
    -> ((js_string t) js_array t) Optdef.t
    -> (bool t) meth
  (** This method checks if the current executable is the default 
      handler for a protocol (aka URI scheme). 

      If so, it will return [true]. Otherwise, it will return [false]. 
  *)

  method setUserTasks : Task.t js_array t -> (bool t) meth
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
  method makeSingleInstance :  
    ((js_string t) js_array t -> js_string t -> unit) callback 
    -> (bool t) meth

  method releaseSingleInstance : unit -> unit meth
  (** Releases all locks that were created by [makeSingleInstance]. 
      This will allow multiple instances of the application to once again 
      run side by side. 
  *)

  method disableHardwareAcceleration : unit -> unit meth
  (** Disables hardware acceleration for current app.

      This method can only be called before app is ready. 
  *)

  method disableDomainBlockingFor3DAPIS : unit -> unit meth
  (** By default, Chromium disables 3D APIs (e.g. WebGL) until restart on a 
      per domain basis if the GPU processes crashes too frequently. 
      This function disables that behaviour.

      This method can only be called before app is ready.
  *)
end

(** Main type *)
type t = app Js.t

