open Js

(** Windows task *)
class type task = object 

  method program : (js_string t) readonly_prop
  (** Path of the program to execute, usually you should 
      specify [process.execPath] which opens the current program *)

  method arguments : (js_string t) readonly_prop
  (** The command line arguments when [program] is executed. *)

  method title : (js_string t) readonly_prop
  (** The string to be displayed in a [JumpList]. *)

  method description : (js_string t) readonly_prop
  (** Description of this task. *)

  method iconPath : (js_string t) readonly_prop
  (** The absolute path to an icon to be displayed in a [JumpList], 
      which can be an arbitrary resource file that contains an icon. 
      You can usually specify [process.execPath] to show the icon 
      of the program. *)

  method iconIndex : int readonly_prop
  (** The icon index in the icon file. 
      If an icon file consists of two or more icons, 
      set this value to identify the icon. 
      If an icon file consists of one icon, 
      this value is 0. 
  *)

end

(** Main type *)
type t = task Js.t

