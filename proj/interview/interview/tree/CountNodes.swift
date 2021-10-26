//
//  CountNodes.swift
//  interview
//
//  Created by Jz D on 2021/10/26.
//

import Foundation








// 确定首尾， 二分法


//  222. Count Complete Tree Nodes

class CountNodes {
    
    class Solution {
        
        
        func countNodes(_ root: TreeNode?) -> Int {
            guard let node = root else{ return 0 }
            var lhs = node.left, rhs = node.right, h = 1
            while rhs != nil{
                rhs = rhs?.right
                lhs = lhs?.left
                h += 1
            }
            if lhs == nil{
                let val = pow(Double(2), Double(h))
                return Int(val) - 1
            }
            else{
                return 1 + countNodes(node.left) + countNodes(node.right)
            }
        }
        
        
        
        
        func countNodes__(_ root: TreeNode?) -> Int {
            guard let node = root else{ return 0 }
            
            return 1 + countNodes(node.left) + countNodes(node.right)
        }
    
    
    
    
    
    func countNodesXx(_ root: TreeNode?) -> Int {
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
}



extension Int{
    func powTwo(with val: Int) -> Int{
        let v = pow(Double(2), Double(val))
        return Int(v)
    }
}
