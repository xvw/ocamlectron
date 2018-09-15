(** Release Infos *)

open Js 

class type release = object 

  method name : (js_string t) readonly_prop
  (** A value that will always be ['node'] for Node.js. 
      For legacy io.js releases, this will be ['io.js']. 
  *)

  method sourceUrl : (js_string t) readonly_prop
  (** an absolute URL pointing to a [.tar.gz] file containing
      the source code of the current release. 
  *)

  method headersUrl : (js_string t) readonly_prop
  (** an absolute URL pointing to a [.tar.gz] file containing only 
      the source header files for the current release. 

      This file is significantly smaller than the full source file 
      and can be used for compiling Node.js native add-ons. 
  *)

  method libUrl : (js_string t Optdef.t) readonly_prop
  (**  an absolute URL pointing to a node.lib file matching the architecture and 
       version of the current release. 
       This file is used for compiling Node.js native add-ons. 
       This property is only present on Windows builds of Node.js and 
       will be missing on all other platforms. 
  *)

  method lts : (js_string t Optdef.t) readonly_prop
  (** a string label identifying the LTS label for this release. 
      This property only exists for LTS releases and is undefined for 
      all other release types, including Current releases. 
  *)

end

(** Main type *)
type t = release Js.t