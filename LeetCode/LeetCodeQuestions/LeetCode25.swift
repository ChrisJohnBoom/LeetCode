//
//  LeetCode25.swift
//  LeetCode
//
//  Created by 杜志 on 2021/3/2.
//  Copyright © 2021 duzhi. All rights reserved.
//

import UIKit

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }

class LeetCode25: NSObject {
    /**
     * Definition for singly-linked list.

     */
    func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if(l1 == nil){
            return l2
        }

        if(l2 == nil){
            return nil
        }
        
        var varl1 = l1

        while(varl1?.next != nil){
            varl1 = varl1?.next
        }
    
        varl1?.next = l2
        
        var val11 = l1
        var val111 = l1?.next
        //对l1进行排序
        while(val11?.next != nil){
            var tempvali = val11
            while(val111?.next != nil){
                var tempvalj = val111
                
                if(tempvalj?.val ?? 0 < tempvali?.val ?? 0){
                    //交换
                    var temp = tempvalj
                    tempvalj?.next = tempvali?.next
                    tempvali?.next = temp?.next
                }
            }

            val11 = val11?.next
        }
        
        return l1
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //以1 为模板  遍历1 插入2里面的节点
        //1短了  2短了
        //边界
        //插入l2节点的时机
        //l1 1  2  4
        //l2 1  3  5
        //>=  l1 < l1 -> next

        if(l1 == nil){
            return l2
        }

        if(l2 == nil){
            return nil
        }

        var varl1 = l1
        var varl2 = l2

        while(varl1?.next != nil){
            let tempNode1 = varl1
            let tempNodeNext = varl1?.next
            let tempNode2 = varl2

            if(tempNode2 == nil || tempNodeNext == nil){
                break
            }

            if(tempNode2?.val ?? 0 >= tempNode1?.val ?? 0 && tempNode2?.val ?? 0 < tempNodeNext?.val ?? 0){
                //将2 的节点插入到1后面
                tempNodeNext?.next = tempNode2
                tempNode2?.next = varl1?.next

                varl1 = tempNodeNext?.next
                varl2 = tempNode2?.next
                continue
            }
            varl1 = varl1?.next
        }

        if(varl2?.next != nil){
            varl1?.next = varl2
        }
        
        return l1
    }
}
