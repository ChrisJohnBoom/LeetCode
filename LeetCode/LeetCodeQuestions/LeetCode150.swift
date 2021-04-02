//
//  LeetCode150.swift
//  LeetCode
//
//  Created by 杜志 on 2021/3/20.
//  Copyright © 2021 duzhi. All rights reserved.
//

import UIKit

class LeetCode150: NSObject {
        func evalRPN(_ tokens: [String]) -> Int {
            //
            var numsArr = [Int]()
            
            for i in 0 ..< tokens.count{
                let subString = tokens[i]
                
                if(subString == "+"){
                    //取两个数出来+然后加到numsArr尾部
                    let num = numsArr.last ?? 0
                    numsArr.removeLast()
                    let num2 = numsArr.last ?? 0
                    numsArr.removeLast()
                    
                    let sum = num + num2
                    numsArr.append(sum)
                    continue
                }
                
                if(subString == "-"){
                    let num = numsArr.last ?? 0
                    numsArr.removeLast()
                    let num2 = numsArr.last ?? 0
                    numsArr.removeLast()
                    
                    let sum = num2 - num2
                    numsArr.append(sum)
                    continue
                }
                
                if(subString == "*"){
                    let num = numsArr.last ?? 1
                    numsArr.removeLast()
                    let num2 = numsArr.last ?? 1
                    numsArr.removeLast()
                    
                    let sum = num * num2
                    numsArr.append(sum)
                    continue
                }
                
                if(subString == "/"){
                    let num = numsArr.last ?? 1
                    numsArr.removeLast()
                    let num2 = numsArr.last ?? 1
                    numsArr.removeLast()

                    let sum:Int = num2 / num
                    numsArr.append(sum)
                    
                    continue
                }
                
                numsArr.append(Int(subString) ?? 0)
            }
            
            return numsArr.first ?? 0
        }
}
