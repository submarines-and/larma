//
//  Timer.swift
//  Larma
//
//  Created by Johannes Sörensen on 2021-03-27.
//
import Cocoa

class TimerService {
    
    var delegate:TimerDelegate?
    var timer = Timer()
    var target = 0
    
    func start(durationInMinutes: Int) {
        timer.invalidate() // just in case this button is tapped multiple times
        
        // convert input value to minutes
        target = durationInMinutes * 60
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    
    @objc func tick(){
        target -= 1
        
        if(target <= 0){
            timer.invalidate()
            done()
        }
        else{
            delegate?.timerTick(remainingTime: target)
        }
    }
    
    func done(){
        delegate?.timerDone()
        
        let notification = NSUserNotification()
        notification.title = "Your time is up!"
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.scheduleNotification(notification)
    }
    
    
    // shared global reference :)
    static var global = TimerService()
    private init() {
        
    }
}


protocol TimerDelegate: class {
    func timerTick(remainingTime: Int)
    func timerDone()
}
