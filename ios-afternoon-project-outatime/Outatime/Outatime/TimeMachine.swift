//
//  TimeMachine.swift
//  Outatime
//
//  Created by Kerby Jean on 1/29/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import Foundation


class TimeMachine {
    
    static let DeLorean = TimeMachine()
    
    /// The starting speed of the machien
    var currentSpeed = 0
    
    /// The timer  that keeps track of the current speen .
    var timer: Timer?
    
    /// The Formatter to format  date to String
    var dater: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM DD YYYY"
        formatter.dateStyle = .medium
        return formatter
    }
        
    // Start travel and update speed
    
    @objc func travel( _ complete: @escaping (_ speed: Int, _ arrived: Bool) -> ()) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            if self.currentSpeed <= 88 {
                self.currentSpeed += 1
                complete(self.currentSpeed, false)
                return 
            }
            self.resetTimer()
            complete(self.currentSpeed, true)
        })
    }

    
    // Reset timer when arrived
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
}
