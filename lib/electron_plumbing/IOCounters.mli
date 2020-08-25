(** Accessors for IO data *)

open Js_of_ocaml
open Js 

class type io_counters = object 

  method readOperationCount : int readonly_prop
  method writeOperationCount : int readonly_prop
  method otherOperationCount : int readonly_prop
  method readTransferCount : int readonly_prop
  method writeTransferCount : int readonly_prop
  method otherTransferCount : int readonly_prop
end

(** Main type *)
type t = io_counters Js.t
