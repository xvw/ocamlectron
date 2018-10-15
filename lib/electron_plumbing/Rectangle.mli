(** Describe a Rectangle *)

class type rectangle = object 
  inherit Size.size
  inherit Position.position
end

type t = rectangle Js.t