// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Cocoa

private let inset: CGFloat = 15
private let resizingMask: NSView.AutoresizingMask = [.width, .height]


class CoolView: NSView
{
    var color: NSColor = NSColor.clear
    var box: NSBox
    
    override init(frame frameRect: NSRect) {
        box = NSBox()
        super.init(frame: frameRect)
        
        autoresizingMask = resizingMask
        
        box.setFrameSize(bounds.insetBy(dx: inset, dy: inset).size)
        box.setFrameOrigin(NSPoint(x: inset, y: inset))
        box.autoresizingMask = resizingMask
        box.titlePosition = .noTitle
        addSubview(box)
        
        addCell(text: "Hello World! 🌍🌎🌏", backgroundColor: NSColor.systemPurple, origin: NSPoint(x: 20, y: 80))
        addCell(text: "Cool View Cells FTW! 🥂🍾", backgroundColor: NSColor.systemOrange, origin: NSPoint(x: 50, y: 150))
    }
    
    required init?(coder: NSCoder) {
        // FIXME: Maybe don't throw?
        fatalError("init(coder:) has not been implemented")
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
