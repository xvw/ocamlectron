(** Interface of Electron application *)

open Js

(** Parameters for [app#relaunch] *)
class type app_relaunch_options = object 
  method args : js_string t readonly_prop
  method execPath : js_string t Optdef.t readonly_prop
end

(** Control your application's event lifecycle. 

    You can find more information on this page :
    {{: https://electronjs.org/docs/api/app }  ElectronJS : documentation for [app] }
*)
class type app = object

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

  method relaunch : app_relaunch_options t Optdef.t -> unit meth
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

end