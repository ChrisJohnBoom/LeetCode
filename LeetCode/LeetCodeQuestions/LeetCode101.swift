//
//  LeetCode101.swift
//  LeetCode
//
//  Created by 杜志 on 2021/3/7.
//  Copyright © 2021 duzhi. All rights reserved.
//

/*
 给定一个二叉树，检查它是否是镜像对称的。

  

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
  

 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3
  

 进阶：

 你可以运用递归和迭代两种方法解决这个问题吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/symmetric-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import UIKit

 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

class LeetCode101: NSObject {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var treeNodeA = root
        var treeNodeB = root
        
        if(root?.left == nil && root?.right == nil){
            return true
        }
        
        //如果节点的左数有或者右子树也有
        while treeNodeA?.left != nil || treeNodeA?.right != nil {
            //比较两树枝是否相同
            if(treeNodeA?.val != treeNodeB?.val){
                return false
            }
         
            treeNodeA = treeNodeA?.left
            treeNodeB = treeNodeB?.right
        }
        
        return true
    }
}
