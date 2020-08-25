(** Release Infos *)

open Js_of_ocaml
open Js 

class type release = object 
  method name : (js_string t) readonly_prop
  method sourceUrl : (js_string t) readonly_prop
  method headersUrl : (js_string t) readonly_prop
  method libUrl : (js_string t Optdef.t) readonly_prop
  method lts : (js_string t Optdef.t) readonly_prop
end

type t = release Js.t
