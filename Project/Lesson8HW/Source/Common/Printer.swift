//
//  Logger.swift
//  Lesson8HW
//

//

import Foundation

// create the protocol to help add some actions that will be executed while the timer is running
protocol TimerActionCreatorProtocol: AnyObject {
    
    func createTimerAction(with seconds: Int)
}

class Printer {
    
    // create the variable with TimerActionCreatorProtocol type that can create a timer actions
    weak var delegate: TimerActionCreatorProtocol?
    
    private var timer: Timer?
    private var seconds: Int = 0
    
    func startPrinting() {
        
        stop()
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(timerAction),
            userInfo: nil,
            repeats: true
        )
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    @objc private func timerAction() {
        // call the function (through the delegate) that creates timer actions and pass the seconds parameter to it
        delegate?.createTimerAction(with: seconds)
        seconds += 1
    }
}
