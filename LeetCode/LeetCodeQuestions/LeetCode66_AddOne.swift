//
//  LeetCode66_AddOne.swift
//  LeetCode
//
//  Created by 杜志 on 2021/2/10.
//  Copyright © 2021 duzhi. All rights reserved.
//

/*
 给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。

 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。

 你可以假设除了整数 0 之外，这个整数不会以零开头。

  

 示例 1：

 输入：digits = [1,2,3]
 输出：[1,2,4]
 解释：输入数组表示数字 123。
 示例 2：

 输入：digits = [4,3,2,1]
 输出：[4,3,2,2]
 解释：输入数组表示数字 4321。
 示例 3：

 输入：digits = [0]
 输出：[1]
  

 提示：

 1 <= digits.length <= 100
 0 <= digits[i] <= 9


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/plus-one
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import UIKit

class LeetCode66_AddOne: NSObject {
    func plusOne(_ digits: [Int]) -> [Int] {
        if(digits.count == 0){
            return digits
        }
        
        var result:[Int] = [Int]()
        
        result.append(contentsOf: digits)
        
        if(result.last != 9){
            result[result.count - 1] = result.last! + 1
            return result
        }else{
            if(result.count == 1){
                return [1,0]
            }
            
            //需要进位
            result.removeLast()
            var result1 = plusOne(result)
            
            result1.append(0)
            
            return result1
        }
    }
}
