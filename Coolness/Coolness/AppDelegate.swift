// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Cocoa

private let title = "My Window"

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    
    var windowDelegate = WindowDelegate()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("In \(#function)")
        
        let rect = NSRect(x: 400, y: 400, width: 400, height: 400)
        
        window = NSWindow(contentRect: rect,
                          styleMask: [.titled, .resizable, .miniaturizable],
                          backing: .buffered,
                          defer: true)
        
        window.delegate = windowDelegate
        
        defer {
            window.orderFront(nil)
        }
        
        guard let frame = NSScreen.main?.frame else { return }
        window.setFrameOrigin(NSPoint(x: frame.midX, y: frame.midY))

        window.title = title
        window.setFrameAutosaveName(title)
        window.isReleasedWhenClosed = false        
        window.contentViewController = CoolController()
    }
}

