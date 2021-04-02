//
//  LeetCode003.swift
//  LeetCode
//
//  Created by 杜志 on 2021/3/14.
//  Copyright © 2021 duzhi. All rights reserved.
//

import UIKit

class LeetCode003: NSObject {
    /*
     思路1 逐个遍历
     */
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        if(s.count == 0){
            return 0
        }
        
        //遍历s
        
        var index = 0
        var tempArr:[String] = [String]()
        var result = 0
        
        while index < s.count {
            var indexB = index
            while indexB < s.count {
                let ch = subString(s, atIndex: indexB)

                if(!tempArr.contains(ch)){
                    tempArr.append(ch)
                    result = tempArr.count > result ? tempArr.count : result
                }else{
                    result = tempArr.count > result ? tempArr.count : result
                    tempArr.removeAll()
                    break
                }
                
                indexB += 1
            }
            
            index += 1
        }
        
        return result
    }
    
    /*
     思路2  取最大子字符串 后面
     */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if(s.count == 0){
            return 0
        }
        
        //遍历s
        
        var startIndex = 0
        var tempArr:[String] = [String]()
        var result = 0
        
        var endIndex = 0
        
        while startIndex < s.count && endIndex < s.count{
            let ch = subString(s, atIndex: endIndex)

            if(!tempArr.contains(ch)){
                tempArr.append(ch)
                result = result > tempArr.count ? result : tempArr.count
            }else{
                result = result > tempArr.count ? result : tempArr.count
                tempArr.removeAll()
                startIndex += 1
            }
            
            endIndex += 1
        }
        
        return result
    }

    
    func subString(_ originalStr:String,atIndex:Int) -> String {
        return subString(originalStr, atIndex: atIndex, length: 1)
    }
    
    
    func subString(_ originalStr:String,atIndex:Int,length:Int) -> String {
        if(atIndex + length >= originalStr.count){
            return ""
        }
        
        return  String(originalStr[originalStr.index(originalStr.startIndex, offsetBy: atIndex)..<originalStr.index(originalStr.startIndex, offsetBy: atIndex+length)])
    }
}
