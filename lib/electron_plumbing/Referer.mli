open Js_of_ocaml
open Js 

class type referer = object 
  method url : js_string t readonly_prop
  method policy : js_string t readonly_prop
end 

type t = referer Js.t
