// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Cocoa

class CoolViewCell: NSView
{
    var backgroundColor: NSColor = NSColor.gray
    var highlighted = false {
        didSet { alphaValue = highlighted ? 0.5 : 1.0 }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        backgroundColor.setFill()
        dirtyRect.fill()
    }
}

// MARK: - Responding to mouse events
extension CoolViewCell
{
    override func mouseDown(with event: NSEvent) {
        highlighted = true
        
        if let superview = superview {
            var reorderedSubviews = superview.subviews.filter { $0 != self }
            reorderedSubviews.append(self)
            superview.subviews = reorderedSubviews
        }
    }
    
    override func mouseDragged(with event: NSEvent) {
        frame = frame.offsetBy(dx: event.deltaX, dy: -event.deltaY)
    }
    
    override func mouseUp(with event: NSEvent) {
        highlighted = false
    }
}
