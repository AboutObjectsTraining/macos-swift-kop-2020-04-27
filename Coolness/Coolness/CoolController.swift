// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Cocoa

class CoolController: NSViewController
{
    override func loadView() {
        view = CoolView(frame: NSRect(x: 0, y: 0, width: 640, height: 480))
    }
    
    override func mouseDown(with event: NSEvent) {
        print("In \(CoolController.self) \(#function)")
    }
    
    var panelController: InspectorPanelController? {
        return (NSApp.delegate as? AppDelegate)?.inspectorPanel.contentViewController as? InspectorPanelController
    }
    
    @objc func addCell(_ sender: Any?) {
        print("In \(#function), sender is \(sender ?? "")")
        guard let coolView = view as? CoolView,
            let panelController = panelController else { return }
        
        coolView.addCell(text: panelController.textField.stringValue, backgroundColor: NSColor.blue, origin: .zero)
    }
}
