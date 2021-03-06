// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import Cocoa

private let textInsets = NSEdgeInsets(top: 7, left: 12, bottom: 8, right: 12)

class CoolViewCell: NSView
{
    var text: String? {
        didSet { resize() }
    }
    
    var backgroundColor: NSColor = NSColor.gray {
        didSet { layer?.backgroundColor = self.backgroundColor.cgColor }
    }
    var highlighted = false {
        didSet { alphaValue = highlighted ? 0.5 : 1.0 }
    }
    
    class var textAttributes: [NSAttributedString.Key: Any] {
        return [.font: NSFont.systemFont(ofSize: 20),
                .foregroundColor: NSColor.white]
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        
        layer?.borderWidth = 3
        layer?.borderColor = NSColor.white.cgColor
        layer?.backgroundColor = backgroundColor.cgColor
        layer?.cornerRadius = 10
        
        autoresizingMask = [.maxXMargin, .minYMargin]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Drawing and resizing
extension CoolViewCell
{
    private func resize() {
        guard let text = text else { return }
        var newSize = (text as NSString).size(withAttributes: type(of: self).textAttributes)
        newSize.width += textInsets.left + textInsets.right
        newSize.height += textInsets.top + textInsets.bottom
        setFrameSize(newSize)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        guard let text = text else { return }
        (text as NSString).draw(at: NSPoint(x: textInsets.left, y: textInsets.bottom),
                                withAttributes: type(of: self).textAttributes)
    }
}

// MARK: - Responding to mouse events
extension CoolViewCell
{
    override func acceptsFirstMouse(for event: NSEvent?) -> Bool {
        return true
    }
    
    override func mouseDown(with event: NSEvent) {
        highlighted = true
        
        if let superview = self.superview {
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
