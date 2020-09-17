//
//  AppDelegate.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import Cocoa
import SwiftUI 

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

//    func keyDown(event: NSEvent!) -> NSEvent {
//        NSLog("key down is \(event.keyCode)");
//        return event
//    }
//
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
//        NSEvent.addLocalMonitorForEvents(matching: NSEvent.EventTypeMask.keyDown, handler: keyDown)
        let contentView = ContentView().environmentObject(UserModel())

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable],
            backing: .buffered, defer: false)
        window.center()
        window.isReleasedWhenClosed = true
        window.isMovable = true
        window.title = "SudoKu Helper 2.0"
        window.isMovableByWindowBackground = true
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}
