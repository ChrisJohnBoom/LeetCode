//
//  ViewController.swift
//  LeetCode
//
//  Created by 杜志 on 2021/2/10.
//  Copyright © 2021 duzhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .orange
        
//        self.testLeetCode66()
//        self.testLeetCode67()
        self.testLeetCode69()
        self.testLeetCode88()
        self.testLeetCode354()
    }


    func testLeetCode66() {
        let testArr:[Int] = [9,9,9,9,9]
//        let testArr:[Int] = [1,2,3,4]

        let resultArr = LeetCode66_AddOne().plusOne(testArr)
        
        print(resultArr)
    }
    

    func testLeetCode67() {
        let strA = "111"
        let strB = "1"
        let resultStr = LeetCode67_BinaryAdd().addBinary(strB, strA)
        
        print(resultStr)
    }
    
    
    func testLeetCode69(){
        let x = 19
        
        let res = LeetCode69_Sqrt().mySqrt(x)
        
        print(res)
    }
    
    func testLeetCode88(){
        /*
         [-1,0,0,3,3,3,0,0,0]
         6
         [1,2,2]
         3
         */
       var nums1 = [-1,0,0,3,3,3,0,0,0]
        let m = 6
        let nums2 = [1,2,2]
        let n = 3
//        var nums1 = [1,0]
//        let nums2 = [2]
        LeetCode88().merge(&nums1, m, nums2, n)
        
        print(nums1)
    }
    
       func testLeetCode354(){
            let envlops:[[Int]] = [[19,17],[8,14],[11,4],[12,20],[19,13],[3,12],[5,12],[19,9],[20,3],[11,19],[20,20],[7,14],[9,13],[2,8],[20,7],[16,6],[16,3],[10,2],[4,6],[3,17]]
//            let envlops:[[Int]] = [[1,1],[1,1],[1,1]]
            let res = LeetCodeQos354().maxEnvelopes(envlops)
            
            print("")
        }
    
}

