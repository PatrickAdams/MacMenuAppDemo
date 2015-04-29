import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSPopoverDelegate {
    
    var statusItem: NSStatusItem!
    var directoryViewController: DirectoryViewController!
    var directoryWindow: NSWindow!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(24)
        statusItem.target = self
        statusItem.action = Selector("onPress")
        statusItem.button!.image = NSImage(named: "icon")
        
        directoryViewController = DirectoryViewController(nibName: "DirectoryViewController", bundle: NSBundle.mainBundle())
        directoryWindow = directoryViewController.view.window
        directoryWindow.backgroundColor = NSColor.clearColor()
        directoryWindow.opaque = false
    }
    
    func applicationDidResignActive(notification: NSNotification) {
        closeWindow()
    }
    
    func onPress() {
        if directoryWindow.visible == false {
            openWindow()
        } else {
            closeWindow()
        }
    }
    
    func openWindow() {
        NSApplication.sharedApplication().activateIgnoringOtherApps(true)
        
        let currentEvent: NSEvent! = NSApp.currentEvent
        let eventFrame = currentEvent.window!.frame
        let eventOrigin:CGPoint! = eventFrame.origin
        let eventSize: CGSize! = eventFrame.size
        let windowFrame = directoryWindow.frame
        let windowSize = windowFrame.size
        let windowTopLeftPosition = CGPointMake(eventOrigin.x + (eventSize.width/2) - (windowSize.width/2), eventOrigin.y)
        
        directoryWindow.setFrameTopLeftPoint(windowTopLeftPosition)
        directoryWindow.makeKeyAndOrderFront(nil)
    }
    
    func closeWindow() {
        directoryWindow.orderOut(self)
    }
}