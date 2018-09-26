open Js 

class type printer_info = object 
  method name : js_string t readonly_prop
  method description : js_string t readonly_prop
  method status : int readonly_prop
  method isDefault : bool t readonly_prop
end

type t = printer_info Js.t