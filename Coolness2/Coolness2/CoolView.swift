// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Cocoa

class CoolView: NSView
{
    @IBOutlet var box: NSBox!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        addCell(text: "Hello World! 🌍🌎🌏", backgroundColor: NSColor.systemPurple, origin: NSPoint(x: 20, y: 80))
        addCell(text: "Cool View Cells FTW! 🥂🍾", backgroundColor: NSColor.systemOrange, origin: NSPoint(x: 50, y: 150))
    }
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
