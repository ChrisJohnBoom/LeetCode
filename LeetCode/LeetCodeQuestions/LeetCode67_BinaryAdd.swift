//
//  LeetCode67_BinaryAdd.swift
//  LeetCode
//
//  Created by 杜志 on 2021/2/10.
//  Copyright © 2021 duzhi. All rights reserved.
//
/*
 给你两个二进制字符串，返回它们的和（用二进制表示）。

 输入为 非空 字符串且只包含数字 1 和 0。

  

 示例 1:

 输入: a = "11", b = "1"
 输出: "100"
 示例 2:

 输入: a = "1010", b = "1011"
 输出: "10101"

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-binary
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import UIKit

class LeetCode67_BinaryAdd: NSObject {
    func addBinary(_ a: String, _ b: String) -> String {
        var i = a.count - 1
        var j = b.count - 1
        var extraNum = 0
        
        var resultStr = ""
        
        //反向遍历  以a为主进行遍历 尾部相加 extra表示相加后的额外进位
        while i >= 0 {
            let subStra = subString(a, atIndex: i)
            
            var bNo = 0
            
            if(j < b.count && j >= 0){
                let subStrb = subString(b, atIndex:j)
                bNo = Int(subStrb) ?? 0
            }

            let aNo = Int(subStra) ?? 0
            
            let resultNo = aNo + bNo + extraNum
            extraNum = 0
            if(resultNo >= 2){
                extraNum = (resultNo) / 2
            }

            resultStr.insert(contentsOf: String((resultNo)%2), at: resultStr.startIndex)
            print("")
            
            j-=1
            i-=1
        }
        
        //如果b的长度大于a 则会走到这里 继续讲额外的b的内容加到结果中
        while(j >= 0){
            let subStrb = subString(b, atIndex: j)
            let subStrbNo = Int(subStrb) ?? 0
            let resultNo = subStrbNo + extraNum
            extraNum = 0

            if(resultNo >= 2){
                extraNum = (resultNo) / 2
            }

            resultStr.insert(contentsOf: String((resultNo)%2), at: resultStr.startIndex)
            
            j-=1
        }
        
        //如果结果>0则插入额外的结果数据
        if(extraNum > 0){
            resultStr.insert(contentsOf: String(extraNum), at: resultStr.startIndex)
        }
        
        return resultStr
    }
    
    
    func subString(_ originalStr:String,atIndex:Int) -> String {
        return  String(originalStr[originalStr.index(originalStr.startIndex, offsetBy: atIndex)..<originalStr.index(originalStr.startIndex, offsetBy: atIndex+1)])
    }
}
