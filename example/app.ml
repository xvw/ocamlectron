let browser_window = Main.Electron.browser_window 
let app = Main.Electron.app

let win = Main.BrowserWindow.make 
    ~width:640 
    ~height:480 
    browser_window

let () = Main.BrowserWindow.load_file win "index.html"