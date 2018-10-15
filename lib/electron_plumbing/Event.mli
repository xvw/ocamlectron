open Js 

class type event = object 
  method _type : js_string t readonly_prop
  method preventDefault : unit -> unit meth
end

type t = event Js.t
