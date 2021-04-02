//
//  LeetCode121.swift
//  LeetCode
//
//  Created by 杜志 on 2021/3/14.
//  Copyright © 2021 duzhi. All rights reserved.
//

import UIKit

class LeetCode121: NSObject {
        func maxProfit(_ prices: [Int]) -> Int {
            if(prices.count <= 1){
                return 0
            }

            if(prices.count == 2){
                return prices[1] - prices[0] > 0 ? prices[1] - prices[0] : 0
            }

            var min = prices[0]
            var minIndex = 0
            var index = 1
            
            var myMaxPro = 0
            
            while(index < prices.count){
                let num = prices[index]

                if(num < min){
                    min = num
                    minIndex = index
                }

                index += 1
            }

            index = minIndex + 1

            if(minIndex >= 2 || index >= prices.count){
                let nextPrices = prices[0 ..< minIndex]
            
                myMaxPro = maxProfit(Array(nextPrices))
                //从minindex开始找右边最大的数
            }
            
            while index < prices.count {
                let tempP = prices[index] - min
                
                myMaxPro = tempP > myMaxPro ? tempP : myMaxPro
                
                index += 1
            }
            
            return myMaxPro
    }
}
