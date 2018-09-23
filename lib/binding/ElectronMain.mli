(** Electron object for Main process *)

open Js

class type electron = object 
  method app : App.t readonly_prop
  method _BrowserWindow : BrowserWindow.singleton t readonly_prop
  method _BrowserWindow_fromOpts : BrowserWindow.constr readonly_prop 
end 

type t = electron Js.t