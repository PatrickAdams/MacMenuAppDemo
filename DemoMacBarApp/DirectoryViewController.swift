import Cocoa

class DirectoryViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var headerView: NSView!
    
    override func viewDidLoad() {
        headerView.wantsLayer = true
        headerView.layer?.backgroundColor = NSColor(red:0.25, green:0.25, blue:0.25, alpha:1).CGColor
    }

    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView = tableView.makeViewWithIdentifier("DirectoryCell", owner: self) as DirectoryCell
        cellView.name.stringValue = "Patrick Adams"
        cellView.status.stringValue = "Out Sick"
        
        return cellView
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return 10
    }
    
    
}
