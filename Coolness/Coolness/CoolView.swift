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
        
        // TODO: Add cells
        
        
        let cell1 = CoolViewCell(frame: NSRect(x: 20, y: 80, width: 180, height: 40))
        cell1.backgroundColor = NSColor.systemPurple
        box.addSubview(cell1)
        
        let cell2 = CoolViewCell(frame: NSRect(x: 50, y: 150, width: 180, height: 40))
        cell2.backgroundColor = NSColor.systemOrange
        box.addSubview(cell2)
        
    }
    
    required init?(coder: NSCoder) {
        // FIXME: Maybe don't throw?
        fatalError("init(coder:) has not been implemented")
    }
}

