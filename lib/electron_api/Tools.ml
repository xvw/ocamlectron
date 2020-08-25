open Js_of_ocaml

let require module_name =
  let open Js.Unsafe in
  fun_call
    (js_expr "require")
    [|inject (Js.string module_name)|]

let relativize path =
  let dirname =
    Js.Unsafe.eval_string "__dirname"
    |> Js.to_string
  in "file://" ^ dirname ^ "/" ^ path

let log content = 
  Firebug.console ## log content;
  content

let js_array_to_list f arr =
  let nar = Js.to_array arr in
  let len = Array.length nar in
  List.init len (fun i -> f nar.(i))
