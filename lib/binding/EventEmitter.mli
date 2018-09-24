open Js 

class type emitter = object 
  method emit_0 : js_string t -> unit meth 
  method emit_1 : js_string t -> 'a -> unit meth
  method emit_2 : js_string t -> 'a -> 'b -> unit meth
  method emit_3 : js_string t -> 'a -> 'b -> 'c -> unit meth
  method getMaxListeners : unit -> int meth
  method on : js_string t -> 'a callback -> unit meth
  method once : js_string t -> 'a callback -> unit meth
  method off : js_string t -> 'a callback -> unit meth
  method addListener : js_string t -> 'a callback -> unit meth
end