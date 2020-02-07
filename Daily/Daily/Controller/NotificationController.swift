//
//  NotificationController.swift
//  Daily
//
//  Created by Kerby Jean on 2/6/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationController {
    
    static func registerLocalNotif() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
    }
    
    static func scheduleLocalNotif(taskName: String, time: String) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "\(taskName)"
        content.body = "\(taskName) is starting in 10 minutes"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default
        
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        if let time = formatter.date(from: time) {
            
            let calendar = NSCalendar.autoupdatingCurrent
            if let finalTime = calendar.date(byAdding: .minute, value: -10, to: time) {
                let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: finalTime)
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                           let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                           center.add(request)
            }
        }
    }
}
