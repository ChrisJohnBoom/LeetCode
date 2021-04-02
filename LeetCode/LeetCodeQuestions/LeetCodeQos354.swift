//
//  LeetCodeQos354.swift
//  LeetCode
//
//  Created by 杜志 on 2021/3/4.
//  Copyright © 2021 duzhi. All rights reserved.
//

import UIKit

class LeetCodeQos354: NSObject {
    /*
     给你一个二维整数数组 envelopes ，其中 envelopes[i] = [wi, hi] ，表示第 i 个信封的宽度和高度。

     当另一个信封的宽度和高度都比这个信封大的时候，这个信封就可以放进另一个信封里，如同俄罗斯套娃一样。

     请计算 最多能有多少个 信封能组成一组“俄罗斯套娃”信封（即可以把一个信封放到另一个信封里面）。

     注意：不允许旋转信封。

      
     示例 1：

     输入：envelopes = [[5,4],[6,4],[6,7],[2,3]]
     输出：3
     解释：最多信封的个数为 3, 组合为: [2,3] => [5,4] => [6,7]。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/russian-doll-envelopes
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    /*
     从大往小套
     */
    
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        var result = 0
        var enlopsCpy = envelopes
        
        if(envelopes.count <= 1){
            return envelopes.count
        }
        
        enlopsCpy.sort { (arr1, arr2) -> Bool in
            let firstA:Int = arr1.first ?? 0
            let firstB:Int = arr2.first ?? 0
            
            return firstA < firstB
        }
        
//        var nodeIndex:Int = 0
        var cmpIndex:Int = 1
        
        var jumpArr:[[Int]] = [[Int]]()
        
//        while nodeIndex < enlopsCpy.count {
            //分别计算个最小值为根节点的内容
            var nodeArr = enlopsCpy[0]
            
            while cmpIndex < enlopsCpy.count {
//                if(nodeIndex == cmpIndex){
//                    continue
//                }
                let cmpArr = enlopsCpy[cmpIndex]
                
//                if(cmpArr == nodeArr){
//                    continue
//                }
                
                if(compareArrs(nodeArr, cmpArr)){
                    nodeArr = cmpArr
                    result += 1
                }else{
                    jumpArr.append(cmpArr)
                }
                
                cmpIndex += 1
            }
            
            
//            nodeIndex += 1
//        }
        
        return result
    }
    
    
    func maxEnvelopes1(_ envelopes: [[Int]]) -> Int {
        var result = 0
        
        var enlopsCpy = envelopes
        
        if(envelopes.count <= 1){
            return envelopes.count
        }
        
        enlopsCpy.sort { (arr1, arr2) -> Bool in
            let firstA:Int = arr1.first ?? 0
            let firstB:Int = arr2.first ?? 0
            
            return firstA < firstB
        }
        
        return myEnvlops(enlopsCpy)
    }
    
    
    func myEnvlops(_ envelopes:[[Int]])->Int{
            var result = 0
            
            var enlopsCpy = envelopes
            
            if(envelopes.count <= 1){
                return envelopes.count
            }
            
            var tempENArr = [[Int]]()
            
            var targetArr:[Int] = [Int]()

            while enlopsCpy.count != 0 {
                let envelopArr = enlopsCpy[0]
                let enBF:Int = envelopArr.first ?? 0
                let enBL:Int = envelopArr.last ?? 0

                //判断i能套多少个？
                if(tempENArr.count == 0){
                    targetArr = envelopArr
                                
                    tempENArr.append(envelopArr)
                    enlopsCpy.remove(at: 0)
                }else{
                    if(compareArrs(targetArr, envelopArr)){
                        //可以套娃
                        targetArr = envelopArr
                        
                        tempENArr.append(envelopArr)
                        //新的加一个节点 旧的原数组减少一个节点
                        enlopsCpy.remove(at: 0)
                        
                        result = tempENArr.count > result ? tempENArr.count : result
                    }else{
                        //不可以套娃
                        //树需要分枝条了
                        //减去最后一个节点 然后重新获取最大个数比较？
                        //删减到当前节点可套娃的地方
                        
                        var tempENArrC:[[Int]] = [[Int]]()
                        tempENArrC.append(contentsOf: tempENArr)
                        tempENArrC.removeLast()
                        
                        var removeIndex = tempENArrC.count - 1
                        while removeIndex > 0 {
                            let removeArr = tempENArrC[removeIndex]
//                            envelopArr当前节点
                            if(compareArrs(removeArr, envelopArr)){
                                //前面的不可以套当前节点
                                break
                            }
                           
                            tempENArrC.remove(at: removeIndex)
                            removeIndex -= 1
                        }
                        
                        tempENArrC.append(envelopArr)
                        enlopsCpy.remove(at: 0)
                        tempENArrC.append(contentsOf: enlopsCpy)
                        
                        if(tempENArrC.count > result){
                            let tempResult = myEnvlops(tempENArrC)//判断另外一个分之
                            
                            print("分树枝 \(tempENArrC) result \(tempResult)")

                            result = tempResult > result ? tempResult : result
                        }
                    }
                }
            }
            
            return result
    }
    
    
    func compareArrs(_ arrA:[Int],_ arrB:[Int]) -> Bool {
        let enAF:Int = arrA.first ?? 0
        let enAL:Int = arrA.last ?? 0

        let enBF:Int = arrB.first ?? 0
        let enBL:Int = arrB.last ?? 0

        if(enAF < enBF && enAL < enBL){
            return true
        }
        
        return false
    }
}
