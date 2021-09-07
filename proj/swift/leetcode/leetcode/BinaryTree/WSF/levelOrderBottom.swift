//
//  levelOrderBottom.swift
//  leetcode
//
//  Created by Jz D on 2021/9/7.
//

import Foundation




class Solution_levelOrderBottom {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        
        var result = [[Int]]()
        guard let n = root else {
            return result
        }
        var levelQ = [n]
        while levelQ.isEmpty == false {
            var nextQueue = [TreeNode]()
            var vals = [Int]()
            while levelQ.isEmpty == false {
                let first = levelQ.removeFirst()
                if let lhs = first.left{
                    nextQueue.append(lhs)
                }
                if let rhs = first.right{
                    nextQueue.append(rhs)
                }
                vals.append(first.val)
            }
            levelQ = nextQueue
            result.insert(vals, at: 0)
        }
        return result
    }
}





// 107. Binary Tree Level Order Traversal II


