//
//  LeetCode92.swift
//  LeetCode
//
//  Created by 杜志 on 2021/3/18.
//  Copyright © 2021 duzhi. All rights reserved.
//

import UIKit

/*
 给你单链表的头节点 head 和两个整数 left 和 right ，其中 left <= right 。请你反转从位置 left 到位置 right 的链表节点，返回 反转后的链表 。
  

 示例 1：


 输入：head = [1,2,3,4,5], left = 2, right = 4
 输出：[1,4,3,2,5]
 示例 2：

 输入：head = [5], left = 1, right = 1
 输出：[5]
  

 提示：

 链表中节点数目为 n
 1 <= n <= 500
 -500 <= Node.val <= 500
 1 <= left <= right <= n

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class LeetCode92: NSObject {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode?{
        if(head?.next == nil || (left == 1 && right == 1)){
            return head
        }
        
        //翻转从left到right的节点
        var index = 1
        var myHead = head
        
        var reverseHead:ListNode?
        var reverseEnd:ListNode?
        //记录需要翻转的头和尾？
        while myHead != nil {
            if(index + 1 == left){
                //开始翻转
                reverseHead = myHead
                reverseEnd = myHead?.next

                index += 1
                myHead = myHead?.next

                continue
            }
            
            if(index > left && index <= right){
                //临时记录当前节点
                let tempNode:ListNode? = myHead
                
                //当前节点前进一个
                myHead = myHead?.next
                
                //当前节点的下一个赋值给翻转尾巴的next指针
                reverseEnd?.next = myHead
                
                //翻转尾巴给当前节点下一个
                tempNode?.next = reverseEnd
                
                reverseHead?.next = tempNode
                
                index += 1
                
                continue
            }
            
            index += 1
            myHead = myHead?.next
        }

        return head
    }
    
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//         
//     }
}
