// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Cocoa

private let title = "My Window"

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    @IBOutlet var coolController: CoolController!
    
    var inspectorPanel: NSPanel!
    
//    var windowDelegate = WindowDelegate()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("In \(#function)")
        
        window.contentViewController = coolController
        window.makeKey()
        
//        configureMainWindow()
        configureInspectorPanel()
        configureMenuItems()
    }
    
    @objc func showMainWindow(sender: Any?) {
        window.orderFront(sender)
    }
    @objc func showInspectorPanel(sender: Any?) {
        inspectorPanel.orderFront(sender)
    }
    
    private func configureMenuItems() {
        guard let windowMenu = NSApp.windowsMenu else { return }
        windowMenu.addItem(withTitle: "My Window",
                           action: #selector(showMainWindow(sender:)),
                           keyEquivalent: "1")
        windowMenu.addItem(withTitle: "Inspector",
                           action: #selector(showInspectorPanel(sender:)),
                           keyEquivalent: "2")
        
        window.isExcludedFromWindowsMenu = true
    }
    
//    private func configureMainWindow() {
//        let rect = NSRect(x: 400, y: 400, width: 400, height: 400)
//
//        window = NSWindow(contentRect: rect,
//                          styleMask: [.titled, .resizable, .miniaturizable, .closable],
//                          backing: .buffered,
//                          defer: true)
//
//        window.delegate = windowDelegate
//
//        defer {
//            window.orderFront(nil)
//            window.makeKey()
//        }
//
//        guard let frame = NSScreen.main?.frame else { return }
//        window.setFrameOrigin(NSPoint(x: frame.midX, y: frame.midY))
//
//        window.title = title
//        window.setFrameAutosaveName(title)
//        window.isReleasedWhenClosed = false
//        window.contentViewController = CoolController()
//    }
    
    private func configureInspectorPanel() {
        let panelFrame = NSRect(x: 700, y: 700, width: 240, height: 200)
        inspectorPanel = NSPanel(contentRect: panelFrame,
                                 styleMask: [.closable, .titled],
                                 backing: .buffered,
                                 defer: true)
        inspectorPanel.contentViewController = InspectorPanelController()
        inspectorPanel.setFrameAutosaveName("Inspector Panel")
        inspectorPanel.title = "Inspector"
        
        inspectorPanel.orderFront(self)
    }
}

