(** Built-in JavaScript 's object  *)


open Js

(** The Set object lets you store unique values of any type,
    whether primitive values or object references. 
*)
module Set : 
sig

  val constr : ('a js_array -> 'a t Js.t) constr
  (** Constructor for set *)

  class type ['a] set = object 

    method size : int readonly_prop
    (** The size accessor property returns the number of 
        elements in a [Set object]. 
    *)

    method add : 'a -> unit meth
    (** Appends a new element with a specified value to the end 
        of a [Set object].
    *)

    method clear : unit -> unit meth
    (** Removes all elements from a [Set object]. *)

    method delete : 'a -> unit meth
    (** Removes the specified element from a Set object. *) 

    method forEach : 
      ('a -> 'a Optdef.t  -> 'a t Js.t Optdef.t -> unit) callback
      -> unit meth
    (** Executes a provided function once for each value in the [Set object], 
        in insertion order. 
    *)

    method has : 'a -> (bool Js.t) meth
    (** returns a [boolean] indicating whether an element with the 
        specified value exists in a [Set object] or not.
    *)

  end

  type 'a t = 'a set Js.t

  val make : 'a list -> 'a t
  (** Helper to build Set *)

  val iteri : (int -> 'a -> unit) -> 'a t -> unit 
  (** Iter on a set *)

end