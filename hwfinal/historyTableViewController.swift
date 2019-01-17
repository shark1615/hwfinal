//
//  historyTableViewController.swift
//  hwfinal
//
//  Created by Apple on 2019/1/15.
//  Copyright © 2019年 Apple. All rights reserved.
//

import UIKit
import CVCalendar

class historyTableViewController: UITableViewController {
        var day: Date?
        var result = [rwdef]()
        var tempResult = [rwdef]()
        var segmentedOfType = ["친구", "가족", "개인", "기타"]
        override func viewDidLoad() {
            super.viewDidLoad()
            print("historyTableViewLoad")
            let selectDay = rwdef.convertToDay(date: day!)
            if let isTemp = rwdef.read(){
                result = isTemp
            }
            for i in result{
                if (i.day?.compare(selectDay!))!.rawValue == 0{
                    tempResult.append(i)
                }
            }
            print(tempResult)
        }
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return tempResult.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "resultTableViewCell", for: indexPath) as! resultTableViewCell
            
            let type = tempResult[indexPath.row].want?.type
            cell.content.text = "Contert: "+(tempResult[indexPath.row].want?.content)!
            cell.date.text = "Day: "+tempResult[indexPath.row].day!
            cell.time.text = "Time: "+(tempResult[indexPath.row].want?.time)!
            cell.type.text = "Type: "+segmentedOfType[type!]
            cell.diary.text = "Diary: "+tempResult[indexPath.row].diary!
            return cell
        }
}
