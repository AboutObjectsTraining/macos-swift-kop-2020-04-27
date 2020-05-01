// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Cocoa

class InspectorPanelController: NSViewController
{
    @IBOutlet var textField: NSTextField!
    
    func loadViewXXX() {
//        let box = NSBox()
//        box.titlePosition = .noTitle
//
//        view = box
//        view.setFrameSize(NSSize(width: 200, height: 160))
//
//        textField = NSTextField(frame: NSRect(x: 15, y: 90, width: 160, height: 30))
//        textField.placeholderString = "Enter a label"
//        view.addSubview(textField)
        
        // TODO: Wire up in IB
        //
        let _ = NSButton(title: "Add Cell",
                         target: nil,
                         action: #selector(CoolController.addCell(_:)))
//        view.addSubview(addButton)
    }
}
