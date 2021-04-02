//
//  LeetCode1.swift
//  LeetCode
//
//  Created by 杜志 on 2021/3/5.
//  Copyright © 2021 duzhi. All rights reserved.
//

import UIKit

class LeetCode1: NSObject {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var index = 0
        var resultIndexArr = [Int]()
        while(index < nums.count){
            let num = nums[index]
            let num2 = target - num

            if(nums.contains(num2)){
                let targetIndex = nums.firstIndex(of: num2)
                resultIndexArr.append(index)
                resultIndexArr.append(targetIndex!)
            }
            
            index += 1
        }

        return resultIndexArr
    }
}
