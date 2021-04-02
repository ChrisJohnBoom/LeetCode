//
//  ParkingSystem.swift
//  LeetCode
//
//  Created by 杜志 on 2021/3/19.
//  Copyright © 2021 duzhi. All rights reserved.
//

import UIKit

class ParkingSystem {
    var bigParkCnt:Int = 0
    var mediumParkCnt:Int = 0
    var smallParkCnt:Int = 0
    
    init(_ big: Int, _ medium: Int, _ small: Int) {
        bigParkCnt = big
        mediumParkCnt = medium
        smallParkCnt = small
    }
    
    func addCar(_ carType: Int) -> Bool {
        if(carType == 3){
            if(smallParkCnt > 0){
                smallParkCnt -= 1
                return true
            }
            return false
        }
        
        if(carType == 2){
            if(mediumParkCnt > 0){
                mediumParkCnt -= 1
                return true
            }
            return false
        }
        
        if(carType == 1){
            if(bigParkCnt > 0){
                bigParkCnt -= 1
                return true
            }
            return false
        }
        
        return false
    }
}
