(** Same of [require] from JavaScript *)
val require : string -> 'a

(** Relativize URL *)
val relativize: string -> string

(** Log data *)
val log : 'a -> 'a