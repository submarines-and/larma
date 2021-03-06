//
//  AppDelegate.swift
//  Larma
//
//  Created by submarines on 2021-03-27.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate, TimerDelegate, PopoverDelegate{

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
    let popover = NSPopover()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
       
        if let button = self.statusItem.button {
         //   button.image = NSImage(named: NSImage.Name("L"))
            button.title = "L"
            button.action = #selector(AppDelegate.togglePopover(_:))
        }
        
        let controller = ViewController.newInstance();
        controller.closeDelegate = self
        self.popover.contentViewController = controller
        self.popover.animates = false
        
        TimerService.global.delegate = self
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
        print(remainingTime)
        
        let mintuesLeft = remainingTime / 60;
        let secondsLeft = remainingTime % 60;
        
        if let button = self.statusItem.button {
            button.title = "\(mintuesLeft):\(secondsLeft)"
        }
    }
    
    func timerDone() {
        if let button = self.statusItem.button {
            button.title = "L"
        }
    }
    
    func closePopover(){
        togglePopover(statusItem);
    }

}
