//
//  Leaderboard.swift
//  sample
//
//  Created by admin on 10/31/20.
//  Copyright © 2020 team9. All rights reserved.
//

import Foundation
import CoreData

class LeaderBoard{
    
    var scores: [NSManagedObject] = []
    
    func readData(){
        let context = AppDelegate.cdContext
        let fetchrequest = NSFetchRequest<NSManagedObject>(entityName: "Score")
        do {
            scores = try context.fetch(fetchrequest)
        }catch let error as NSError{
            print("Fetch error \(error), \(error.userInfo)")
        }
    }
    
    func sortedScores() -> [NSManagedObject] {
        readData()
        var needSwap = true
        let length = scores.count - 2
        var num1: Int
        var num2: Int
        while needSwap{
            needSwap = false
            for i in 0...length {
                num1 = scores[i].value(forKey: "score") as! Int
                num2 = scores[i+1].value(forKey: "score") as! Int
                if (num2 > num1){
                    let temp = scores[i]
                    scores[i] = scores[i+1]
                    scores[i+1] = temp
                    needSwap = true
                }
            }
        }
        return scores
    }
    
}
