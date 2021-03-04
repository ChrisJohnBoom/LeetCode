//
//  LeetCode88.swift
//  LeetCode
//
//  Created by Jason on 2021/3/3.
//  Copyright © 2021 duzhi. All rights reserved.
//

import UIKit

/*
 88. 合并两个有序数组
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。你可以假设 nums1 的空间大小等于 m + n，这样它就有足够的空间保存来自 nums2 的元素。

  

 示例 1：

 输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 输出：[1,2,2,3,5,6]
 示例 2：

 输入：nums1 = [1], m = 1, nums2 = [], n = 0
 输出：[1]
  

 提示：

 nums1.length == m + n
 nums2.length == n
 0 <= m, n <= 200
 1 <= m + n <= 200
 -109 <= nums1[i], nums2[i] <= 109
 */
class LeetCode88: NSObject {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if(n == 0){
            return
        }
        
        var index:Int = 0
        var nums1Cnt = m

        if( m == 0){
            nums1.removeAll()
            return nums1.append(contentsOf: nums2)
        }else{
            
            while index < n {
                let num = nums2[index]
                print("num \(num)")
                //取一个数据出来插入对应的nums1中
                var insertFlag:Bool = false
                for i in 0 ..< nums1.count {
                    let numA = nums1[i]
                    
                    if(num <= numA || i >= nums1Cnt){
                        //插在前面
                        nums1.insert(num, at: i)
                        nums1Cnt += 1
                        break
                    }
                }
                
                index += 1
            }
        }
        
        if(nums1.count > nums1Cnt){
            var j = nums1.count
            
            while j > nums1Cnt {
                nums1.remove(at: j - 1)
                
                j -= 1
            }
        }
    }
    
}
