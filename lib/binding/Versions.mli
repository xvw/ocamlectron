(** Versions allowed *)

open Js

class type versions = object 

  method chrome : (js_string t) readonly_prop
  (** Resolve the chrome version *)

  method electron : (js_string t) readonly_prop
  (** Resolve the electron version *)
end

(** Main type *)
type t = versions Js.t