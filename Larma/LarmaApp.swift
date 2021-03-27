//
//  LarmaApp.swift
//  Larma
//
//  Created by Johannes Sörensen on 2021-03-27.
//

import Cocoa
import SwiftUI

@main
struct LarmaApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        
        // cant remove this, need something
          Settings {
              EmptyView()
          }
      }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusBar: StatusBarController?

    // on start
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = MainWindow()
        popover.contentSize = NSSize(width: 150, height: 300)
        popover.contentViewController = NSHostingController(rootView: contentView)
        statusBar = StatusBarController.init(popover)
    }

    // on close
    func applicationWillTerminate(_ aNotification: Notification) {
        print("Hejrå")
    }
}
