(** Versions allowed *)

open Js

class type versions = object 

  method chrome : (js_string t) readonly_prop
  method electron : (js_string t) readonly_prop
end

type t = versions Js.t