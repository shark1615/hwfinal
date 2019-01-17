//
//  rwdef.swift
//  hwfinal
//
//  Created by Apple on 2019/1/12.
//  Copyright © 2019年 Apple. All rights reserved.
//

import Foundation
struct process:Codable{
    var time: String?
    var type: Int?
    var content: String?
    
}
struct rwdef: Codable {
    
    var day:String?
    var want: process?
    var diary: String?
    
    static func read() -> [rwdef]? {
        if let data = UserDefaults.standard.data(forKey: "result"), let result = try? PropertyListDecoder().decode([rwdef].self, from: data) {
            return result
        } else {
            return nil
        }
    }
    
    static func save(result: [rwdef]) {
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(result) {
            UserDefaults.standard.set(data, forKey: "result")
            
        }
    }
    
    static func convertToDay(date: Date) -> String?{
        let dayFormatter = DateFormatter()
        
        dayFormatter.dateFormat = "yyyy年MM月dd日"
        
        let dayString = dayFormatter.string(from: date)
        
        return dayString
    }
    
    static func convertToTime(date: Date) -> String?{
        
        let timeFormatter = DateFormatter()
        
        timeFormatter.dateFormat = "HH點mm分"
        
        let timeString = timeFormatter.string(from: date)
        
        return timeString
    }
}
