//
//  ViewController.swift
//  Larma
//
//  Created by Johannes Sörensen on 2021-03-27.
//

import Cocoa

class ViewController: NSViewController {
    var timer = TimerService.global
    
    
    static func newInstance() -> ViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier("ViewController")
        
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? ViewController else {
            fatalError("Unable to instantiate ViewController in Main.storyboard")
        }
        
        return viewcontroller
    }
    
    @IBAction func onEnter(_ sender: NSTextField) {
        let parsed = Int(sender.stringValue) ?? 0;
        timer.start(durationInMinutes: parsed)
        sender.stringValue = ""
    }
}

