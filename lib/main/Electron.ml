type t = Binding.ElectronMain.t

let obj = Common.Tools.require "electron"

let browser_window = obj ##. _BrowserWindow_fromOpts
let browser_window_singleton = obj ##. _BrowserWindow
let app = obj ##. app