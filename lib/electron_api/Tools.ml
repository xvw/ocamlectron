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