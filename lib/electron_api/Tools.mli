open Js_of_ocaml

(** Same of [require] from JavaScript *)
val require : string -> 'a

(** Relativize URL *)
val relativize: string -> string

(** Log data *)
val log : 'a -> 'a

(** Coerce JSArray to Caml List *)
val js_array_to_list : ('a -> 'b) -> 'a Js.js_array Js.t -> 'b list
