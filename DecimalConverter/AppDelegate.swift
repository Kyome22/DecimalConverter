//
//  AppDelegate.swift
//  DecimalConverter
//
//  Created by Takuto Nakamura on 2021/07/20.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    var button: NSStatusBarButton!
    let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        button = statusItem.button!
        button.image = NSImage(named: "StatusIcon")
        button.target = self
        button.action = #selector(pushed(_:))
        button.sendAction(on: [.leftMouseDown, .rightMouseDown])
        
        popover.behavior = NSPopover.Behavior.transient
        let sb = NSStoryboard(name: "ConverterVC", bundle: Bundle.main)
        popover.contentViewController = (sb.instantiateInitialController() as! ConverterVC)
    }
    
    @objc func pushed(_ sender: Any) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }

}
