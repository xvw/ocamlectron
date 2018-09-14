(** Direct Binding for stuff from NodeJS and Electron *)

open Js

(** Versions allowed *)
class type versions = object 

  method chrome : (js_string t) readonly_prop
  (** Resolve the chrome version *)

  method electron : (js_string t) readonly_prop
  (** Resolve the electron version *)
end


(** Data about CPU usage *)
class type cpu_usage = object 

  method percentCPUUsage : int readonly_prop
  (** Percentage of CPU used since the last call to getCPUUsage. 
      First call returns [0]. 
  *)

  method idleWakeupsPerSecond : int readonly_prop
  (** The number of average idle cpu wakeups per second since the 
      last call to getCPUUsage. First call returns [0]. Will always 
      return [0] on Windows. 
  *)
end

(** Accessors for IO data *)
class type io_counters = object 

  method readOperationCount : int readonly_prop
  (** The number of I/O read operations. *)

  method writeOperationCount : int readonly_prop
  (** The number of I/O write operations. *)

  method otherOperationCount : int readonly_prop
  (** The number of I/O other operations. *)

  method readTransferCount : int readonly_prop
  (** The number of I/O read transfers. *)

  method writeTransferCount : int readonly_prop
  (** The number of I/O write transfers. *)

  method otherTransferCount : int readonly_prop
  (** Then number of I/O other transfers. *)
end


(** Data about process 's memorymemory usage statistics about the 
    current process. Note that all statistics are reported in Kilobytes  
*)
class type process_memory_info = object 

  method workingSetSize : int readonly_prop
  (** The amount of memory currently pinned to actual physical RAM. *)

  method peakWorkingSetSize : int readonly_prop
  (** The maximum amount of memory that has ever been pinned to actual 
      physical RAM. 
  *)

  method privateBytes : int readonly_prop
  (** The amount of memory not shared by other processes, such as JS heap 
      or HTML content. 
  *)

  method sharedBytes : int readonly_prop
  (** The amount of memory shared between processes, typically memory consumed 
      by the Electron code itself. 
  *)

end


(** Object giving memory usage statistics about the entire system. 
    Note that all statistics are reported in Kilobytes. 
*)
class type system_memory_info = object 

  method total : int readonly_prop
  (** The total amount of physical memory in Kilobytes available to the system. *)

  method free : int readonly_prop
  (** The total amount of memory not being used by applications or disk cache. *)

  method swapTotal : int readonly_prop
  (** The total amount of swap memory in Kilobytes available to the system. 
      {b only Windows and Linux} 
  *)

  method swapFree : int readonly_prop
  (** The free amount of swap memory in Kilobytes available to the system. 
      {b only Windows and Linux} 
  *)

end



(** The process object is a global that provides information about, 
    and control over, the current Node.js process.

    You can find more information on this page :

    - {{: https://nodejs.org/api/process.html }  NodeJS : documentation for [process] } 

    - {{: https://electronjs.org/docs/api/process }  ElectronJS : documentation for [process] } 
*)
class type process = object

  method abort : unit -> unit meth
  (** causes the Node.js process to exit immediately and generate a core file. *)

  method defaultApp : (bool t Optdef.t) readonly_prop
  (** When app is started by being passed as parameter to the 
      default app, this property is [true] in the main process, 
      otherwise it is [undefined]. 
  *)

  method mas : (bool t Optdef.t) readonly_prop
  (** For Mac App Store build, this property is [true], for other builds 
      it is undefined. 
  *)

  method windowsStore : (bool t Optdef.t) readonly_prop
  (** For Windows Store build, this property is [true], for other builds 
      it is undefined. 
  *)

  method noAsar : (bool t) prop
  (** A [Boolean] that controls ASAR support inside your application. 
      Setting this to [true] will disable the support for [asar] archives in 
      Node's built-in modules. 
  *)

  method noDeprecation : (bool t) prop
  (** A [Boolean] that controls whether or not deprecation warnings are 
      printed to [stderr]. Setting this to true will silence deprecation 
      warnings. 

      This property is used instead of the [--no-deprecation] command line 
      flag. 
  *)

  method resourcesPath : (js_string t) readonly_prop
  (** A [String] representing the path to the resources directory. *)

  method throwDeprecation : (bool t) prop
  (** A [Boolean] that controls whether or not deprecation warnings will 
      be thrown as exceptions. Setting this to [true] will throw errors 
      for deprecations. 

      This property is used instead of the [--throw-deprecation] 
      command line flag. 
  *)

  method traceDeprecation : (bool t) prop
  (** A [Boolean] that controls whether or not deprecations printed 
      to stderr include their stack trace. Setting this to [true] will 
      print stack traces for deprecations. 

      This property is instead of the [--trace-deprecation] command 
      line flag. 
  *)

  method traceProcessWarnings : (bool t) prop 
  (** A [Boolean] that controls whether or not process warnings 
      printed to stderr include their stack trace. Setting this to [true] 
      will print stack traces for process warnings (including deprecations). 

      This property is instead of the [--trace-warnings] command line flag. 
  *)

  method _type : (js_string t) readonly_prop
  (** A [String] representing the current process's type, can be ["browser"]
      (i.e. main process) or ["renderer"].
  *)

  method versions : (versions t) readonly_prop
  (** Returns an object with versions labels. *)

  method crash : unit -> unit meth
  (** Causes the main thread of the current process crash. *)

  method getCPUUsage : unit -> (cpu_usage t) meth
  (** Returns [cpu_usage] *)

  method getIOCounters : unit -> (io_counters t) meth
  (** {b only Windows and Linux}

      Returns [io_counters] 
  *)

  method getProcessMemoryInfo : unit -> (process_memory_info t) meth
  (** Returns an object giving memory usage statistics about the 
      current process. Note that all statistics are reported in Kilobytes.
  *)

  method getSystemMemoryInfo : unit -> (system_memory_info t) meth
  (** Returns an object giving memory usage statistics about the entire system.
      Note that all statistics are reported in Kilobytes. *)

  method hang : unit -> unit meth
  (** Causes the main thread of the current process hang. *)

  method setFdLimit : int -> unit meth
  (** Sets the file descriptor soft limit to maxDescriptors or the OS 
      hard limit, whichever is lower for the current process. 
  *)

end




(** Parameters for [app#relaunch] *)
class type electron_app_relaunch_options = object
  method args : js_string t readonly_prop
  method execPath : js_string t Optdef.t readonly_prop
end



(** Control your application's event lifecycle.

    You can find more information on this page :
    {{: https://electronjs.org/docs/api/app }  ElectronJS : documentation for [app] }
*)
class type electron_app = object

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

  method relaunch : electron_app_relaunch_options t Optdef.t -> unit meth
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

end