//
//  AppDelegate.swift
//  Larma
//
//  Created by Johannes Sörensen on 2021-03-27.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate, TimerDelegate {


    
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    let popover = NSPopover()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
       
        if let button = self.statusItem.button {
         //   button.image = NSImage(named: NSImage.Name("L"))
            button.title = "L"
            button.action = #selector(AppDelegate.togglePopover(_:))
        }
        
        self.popover.contentViewController = ViewController.newInstance()
        self.popover.animates = false
    }
    
    @objc func togglePopover(_ sender: NSStatusItem) {
        if self.popover.isShown {
            self.popover.performClose(sender)
        }
        else {
            if let button = self.statusItem.button {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
             }
        }
    }
    
    
    func timerTick(remainingTime: Int) {
        print("tick")
        print(remainingTime)
        if let button = self.statusItem.button {
            button.title = "\(remainingTime)"
        }
    }
    
    func timerDone() {
        print("done")
        if let button = self.statusItem.button {
            button.title = "L"
        }
    }

    

}
