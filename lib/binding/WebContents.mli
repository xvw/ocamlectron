(** Render and control web pages. 

    - {{: https://electronjs.org/docs/api/web-contents } Documentation for [WebContents]}
*)




class type web_contents = object 

end

(** Main type *)
type t = web_contents Js.t