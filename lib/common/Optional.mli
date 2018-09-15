(** Helper to work with optional values (empty values or not) to 
    deal with [option], [opt] and [optdef] with a common API. *)


 (** {2 Interface} *)

(** Common interface of optional values *)
module type OPTION = 
sig

  (** {3 Types} *)

  type 'a t
  (** The optional type *)

  (** {3 Functions} *)

  val empty : 'a t 
  (** Returns the empty values of the ['a t] *)

  val pure : 'a -> 'a t 
  (** Consider a value as an optional value. *)

  val map : 'a t -> ('a -> 'b)-> 'b t
  (** Apply a function to an optional value if it is available. 
      Returns the result of the application. *)

  val bind : 'a t -> ('a -> 'b t) -> 'b t
  (** Apply a function returning an optional value to an optional value *)

  val test : 'a t -> bool
  (** Returns [true] if a value is available, [false] otherwise. *)

  val iter : 'a t -> ('a -> unit) -> unit
  (** Apply a function to an optional value if it is available. *)

  val case : 'a t -> (unit -> 'b) -> ('a -> 'b) -> 'b
  (** Pattern matching on optional values. *)

  val get : 'a t -> (unit -> 'a) -> 'a
  (** Get the value. If no value available, 
      an alternative function is called to get a default value. *)

  val from_opt : 'a Js.Opt.t -> 'a t
  (** Convert from ['a Js.Opt.t]. *)

  val from_optdef : 'a Js.Optdef.t -> 'a t
  (** Convert from ['a Js.Optdef.t]. *)

  val from_option : 'a option -> 'a t
  (** Convert from ['a option]. *)

  val to_opt : 'a t -> 'a Js.Opt.t
  (** Convert to ['a Js.Opt.t]. *)

  val to_optdef : 'a t -> 'a Js.Optdef.t
  (** Convert to ['a Js.Optdef.t]. *)

  val to_option : 'a t -> 'a option
  (** Convert to ['a option]. *)

  val to_bool : 'a t -> bool
  (** Convert to [bool], [true] if the value is not empty, 
      [false] if the value is empty.
   *)

  (** Infix operators *)
  module Infix : 
  sig 
    val (>>=) : 'a t -> ('a -> 'b t) -> 'b t
    (** Infix version of [OPTIONAL.bind] *)
    
    val (>|=) : 'a t -> ('a -> 'b) -> 'b t
    (** Infix version of [OPTIONAL.map] *)

    val (>>!) : 'a t -> (unit -> 'a) -> 'a
    (** Infix version of [OPTIONAL.get] *)
  end

  include module type of Infix

end


(** {2 Implementations} *)


module Option : OPTION with type 'a t = 'a option
(** Optional for ['a option]. *)

module Opt : OPTION with type 'a t = 'a Js.Opt.t
(** Optional for ['a Js.Opt.t]. *)

module Optdef : OPTION with type 'a t = 'a Js.Optdef.t
(** Optional for ['a Js.Optdef.t]. *)