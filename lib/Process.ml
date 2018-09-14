open Optional

type t = Binding.process Js.t
let process = Js.Unsafe.global##.process

let extract_bool result = 
  Optdef.get result (fun () -> false)

let default_app () = extract_bool (process ##. defaultApp)
let mas () = extract_bool (process ##. mas)

let enable_asar () = process ##. noAsar := Js._false
let disable_asar () = process ##. noAsar := Js._true
let asar_enabled () = 
  let result = process ##. noAsar in 
  not (Js.to_bool result)

let enable_deprecation_warning () = process ##. noDeprecation := Js._false
let disable_deprecation_warning () = process ##. noDeprecation := Js._true
let deprecation_warning_enabled () = 
  let result = process ##. noDeprecation in 
  not (Js.to_bool result)

let resource_path () = 
  let result = process ##. resourcePath in 
  Js.to_string result