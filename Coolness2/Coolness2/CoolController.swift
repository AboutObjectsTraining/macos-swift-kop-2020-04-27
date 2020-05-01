// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Cocoa

class CoolController: NSViewController
{
    var panelController: InspectorPanelController? {
        return (NSApp.delegate as? AppDelegate)?.inspectorPanel.contentViewController as? InspectorPanelController
    }
    
    @IBAction func addCell(_ sender: Any?) {
        guard let coolView = view as? CoolView, let panelController = panelController else { return }
        coolView.addCell(text: panelController.textField.stringValue,
                         backgroundColor: panelController.colorWell.color,
                         origin: .zero)
    }
}
