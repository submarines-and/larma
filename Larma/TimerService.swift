//
//  Timer.swift
//  Larma
//
//  Created by Johannes Sörensen on 2021-03-27.
//
import Cocoa

class TimerService {
    
    static var global = TimerService()
    
    func start(durationInMinutes: Double) {
 
        // convert input value to minutes
        let duration = durationInMinutes * 60
   
        Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(done), userInfo: nil, repeats: false)
    }
    
    
    @objc func done()
    {
        print("Done")
    }
    
}

