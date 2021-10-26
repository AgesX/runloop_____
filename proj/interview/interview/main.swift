//
//  main.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation















// 确定首尾， 二分法


//  222. Count Complete Tree Nodes

class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        var rightH = 0
        var leftH = 0
        var cur = root
        while cur != nil{
            cur = cur?.right
            rightH += 1
        }
        cur = root
        while cur != nil{
            cur = cur?.left
            leftH += 1
        }
        if leftH == rightH{
            let val = pow(Double(2), Double(rightH))
            return Int(val) - 1
        }
        else{
            
            
        }
        return 0
    }
    
    
    
    
}
