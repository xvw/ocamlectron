(** Control your application's event lifecycle.

    You can find more information on this page :
    {{: https://electronjs.org/docs/api/app }  ElectronJS : documentation for [app] }
*)

open Js_of_ocaml
open Js 

class type app = object

  inherit EventEmitter.emitter

  method quit : unit -> unit meth
  method exit : int Optdef.t -> unit meth

  method relaunch : <
    args: js_string t readonly_prop; 
    execPath : js_string t Optdef.t readonly_prop
  > t Optdef.t -> unit meth

  method isReady : unit -> (bool t) meth
  method focus : unit -> unit meth
  method hide : unit -> unit meth
  method show : unit -> unit meth
  method getAppPath : unit -> (js_string t) meth
  method getPath : js_string t -> (js_string t) meth
  method setPath : js_string t -> js_string t -> unit meth
  method getVersion : unit -> (js_string t) meth
  method getName : unit -> (js_string t) meth
  method setName : js_string t -> unit meth
  method getLocale : unit -> (js_string t) meth
  method addRecentDocument : js_string t -> unit meth
  method clearRecentDocuments : unit -> unit meth

  method setAsDefaultProtocolClient :
    js_string t
    -> (js_string t) Optdef.t
    -> ((js_string t) js_array t) Optdef.t
    -> (bool t) meth

  method removeAsDefaultProtocolClient : 
    js_string t 
    -> (js_string t) Optdef.t
    -> ((js_string t) js_array t) Optdef.t
    -> (bool t) meth

  method isDefaultProtocolClient : 
    js_string t 
    -> (js_string t) Optdef.t
    -> ((js_string t) js_array t) Optdef.t
    -> (bool t) meth

  method setUserTasks : Task.t js_array t -> (bool t) meth
  method makeSingleInstance :  
    ((js_string t) js_array t -> js_string t -> unit) callback 
    -> (bool t) meth

  method releaseSingleInstance : unit -> unit meth
  method disableHardwareAcceleration : unit -> unit meth
  method disableDomainBlockingFor3DAPIS : unit -> unit meth
end

(** Main type *)
type t = app Js.t

