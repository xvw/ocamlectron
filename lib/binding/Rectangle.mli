(** Describe a Rectangle *)

class type rectangle = object 
  inherit Size.size
  inherit Position.position
end

(** Main type *)
type t = rectangle Js.t