//
//  Timer.swift
//  Larma
//
//  Created by Johannes Sörensen on 2021-03-27.
//
import Cocoa
import UserNotifications

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
        
        print("sending notification");
        
        let content = UNMutableNotificationContent()
        content.title = "Your time is up!"
        content.categoryIdentifier = "larma"
        content.sound = UNNotificationSound.default
        
        /*
         Maybe I can just use this for scheduling instead?
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 30
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        */
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print("Sent");
    }
    
    
    // shared global reference :)
    static var global = TimerService()
    private init() {
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Ok")
            }
            else {
                print("No")
            }
        }
        
    }
}


protocol TimerDelegate: class {
    func timerTick(remainingTime: Int)
    func timerDone()
}
