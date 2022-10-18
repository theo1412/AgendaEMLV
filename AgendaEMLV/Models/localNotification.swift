//
//  localNotification.swift
//  ToDoList
//
//  Created by Theo DOS REIS on 16/10/2022.
//

import Foundation
import UserNotifications

class NotificationManager{
    
    static let instance=NotificationManager()
    
    func requstAuthorization(){
        let options: UNAuthorizationOptions = [.alert,.sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success,
            error in
            if let error = error {
                print("Error\(error)")
            }else{
                print("Success")
            }
        }
    }

    
    
    func pushNotification(input:Date,text:String){
         
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: input)
        let minute = calendar.component(.minute, from: input)
        let second = calendar.component(.second, from: input)
        let day = calendar.component(.day, from: input)
        let month = calendar.component(.month, from: input)
        
        
        let content = UNMutableNotificationContent()
        content.title = "N'oublie pas de faire ça !"
        content.subtitle = text
        content.sound = .default
        content.badge = 1 
        
        var dateC=DateComponents()
        
        dateC.hour=hour
        dateC.minute=minute
        dateC.second=second
        dateC.month=month
        dateC.day=day
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateC, repeats: false)
        
        let requst = UNNotificationRequest(
            identifier: UUID().uuidString, content: content,trigger: trigger
        )
        UNUserNotificationCenter.current().add(requst)
    }
    
    
}
