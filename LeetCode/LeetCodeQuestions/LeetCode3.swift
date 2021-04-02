//
//  LeetCode3.swift
//  LeetCode
//
//  Created by 杜志 on 2021/3/22.
//  Copyright © 2021 duzhi. All rights reserved.
//
/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

  

 示例 1:

 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 示例 4:

 输入: s = ""
 输出: 0
  

 提示：

 0 <= s.length <= 5 * 104
 s 由英文字母、数字、符号和空格组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import UIKit

class LeetCode3: NSObject {
    //暴力破解
    func lengthOfLongestSubstringV1(_ s: String) -> Int {
        if(s.count <= 1){
            return s.count
        }
        
        var startIndex = 0
        var endIndex = 0
        
        var tempArr = [String]()
        var result = 0
        //从开始找起
        while startIndex < s.count {
            let startStr = subString(s, atIndex: startIndex)
            tempArr.append(startStr)
            result = tempArr.count > result ? tempArr.count : result

            endIndex = startIndex + 1
            while endIndex < s.count {
                let endStr = subString(s, atIndex: endIndex)
                //比较是否相同
                if(tempArr.contains(endStr)){
                    //包含则进位
                    tempArr.removeFirst()
                    break
                }
                
                tempArr.append(endStr)
                
                result = tempArr.count > result ? tempArr.count : result
                
                endIndex += 1
            }
            
//            tempArr.removeAll()

            startIndex += 1
        }
        
        return result;
    }

    
    //找两个游标？
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if(s.count <= 1){
            return s.count
        }
        
        var startIndex = 0
        var endIndex = startIndex + 1
        
        var result = 0
        //从开始找起
        while (startIndex < s.count && endIndex < s.count){
            //初始标记位
            let startStr = subString(s, atIndex: startIndex)

            //游动标记位
            let endStr = subString(s, atIndex: endIndex)

            if(result > s.count - startIndex){
                break;
            }
            
            if(startStr == endStr){
                //如果包含了说明需要进位
                let num = endIndex - startIndex + 1
                
                result = result > num ? result : num
                
                startIndex += 1
            }else{
                endIndex += 1
                
                let num = endIndex - startIndex + 1
                
                result = result > num ? result : num
            }
        }
        
        return result;
    }
    
    func subString(_ originalStr:String,atIndex:Int) -> String {
        return  String(originalStr[originalStr.index(originalStr.startIndex, offsetBy: atIndex)..<originalStr.index(originalStr.startIndex, offsetBy: atIndex+1)])
    }
}
