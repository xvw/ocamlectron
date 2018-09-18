type t = Binding.ElectronMain.t

let browser_window (electron : t) = electron ##. _BrowserWindow_fromOpts
let browser_window_singleton (electron : t) = electron ##. _BrowserWindow
let app (electron : t) = electron ##. app