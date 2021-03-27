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
    var statusBar: StatusBarController?

    // on start
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = MainWindow()
        let mainView = NSHostingView(rootView: contentView)
        mainView.frame =  NSRect(x: 0, y: 0, width: 200, height: 200)
        statusBar = StatusBarController(mainView)
    }

    // on close
    func applicationWillTerminate(_ aNotification: Notification) {
        print("Close")
    }
}
