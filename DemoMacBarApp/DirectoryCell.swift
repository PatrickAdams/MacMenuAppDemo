import Cocoa

class DirectoryCell: NSTableCellView {
    
    @IBOutlet weak var name: NSTextField!
    @IBOutlet weak var status: NSTextField!
    @IBOutlet weak var avatar: NSImageView!

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
    }
}
