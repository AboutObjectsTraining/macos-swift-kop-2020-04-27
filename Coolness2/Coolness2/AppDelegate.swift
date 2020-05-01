// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    @IBOutlet var coolController: CoolController!
    
    @IBOutlet var inspectorPanel: NSPanel!
    @IBOutlet var inspectorPanelController: InspectorPanelController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        inspectorPanel.contentViewController = inspectorPanelController
        window.contentViewController = coolController
        window.isExcludedFromWindowsMenu = true
        window.makeKey()
    }
    
    @IBAction func showMainWindow(_ sender: Any?) {
        window.makeKeyAndOrderFront(sender)
    }
    @IBAction func showInspectorPanel(_ sender: Any?) {
        inspectorPanel.orderFront(sender)
    }
}
