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
    
}

