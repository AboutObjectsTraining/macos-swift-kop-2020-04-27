// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Cocoa

class CoolView: NSView
{
    @IBOutlet var box: NSBox!
}

extension CoolView
{
    func addCell(text: String, backgroundColor: NSColor, origin: NSPoint) {
        let newCell = CoolViewCell()
        newCell.setFrameOrigin(origin)
        newCell.setFrameSize(NSSize(width: 180, height: 40))
        newCell.text = text
        newCell.backgroundColor = backgroundColor
        box.addSubview(newCell)
    }
}
