(** Accessors for IO data *)

open Js 

class type io_counters = object 

  method readOperationCount : int readonly_prop
  (** The number of I/O read operations. *)

  method writeOperationCount : int readonly_prop
  (** The number of I/O write operations. *)

  method otherOperationCount : int readonly_prop
  (** The number of I/O other operations. *)

  method readTransferCount : int readonly_prop
  (** The number of I/O read transfers. *)

  method writeTransferCount : int readonly_prop
  (** The number of I/O write transfers. *)

  method otherTransferCount : int readonly_prop
  (** Then number of I/O other transfers. *)
end

(** Main type *)
type t = io_counters Js.t