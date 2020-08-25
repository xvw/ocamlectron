open Js_of_ocaml
open Js

class type task = object 
  method program : (js_string t) readonly_prop
  method arguments : (js_string t) readonly_prop
  method title : (js_string t) readonly_prop
  method description : (js_string t) readonly_prop
  method iconPath : (js_string t) readonly_prop
  method iconIndex : int readonly_prop
end

type t = task Js.t

