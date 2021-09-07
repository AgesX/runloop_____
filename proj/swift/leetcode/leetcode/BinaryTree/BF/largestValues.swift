//
//  largestValues.swift
//  leetcode
//
//  Created by Jz D on 2021/9/7.
//

import Foundation





class Solution_largestValues {
    func largestValues(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        guard let n = root else {
            return result
        }
        var levelQ = [n]
        while levelQ.isEmpty == false {
            var nextQ = [TreeNode]()
            var val: Int? = nil
            while levelQ.isEmpty == false {
                let first = levelQ.removeFirst()
                if let lhs = first.left{
                    nextQ.append(lhs)
                }
                if let rhs = first.right{
                    nextQ.append(rhs)
                }
                let tmp = first.val
                if let v = val{
                    if tmp > v{
                        val = tmp
                    }
                }
                else{
                    val = tmp
                }
            }
            if let v = val{
                result.append(v)
            }
            levelQ = nextQ
        }
        return result
    }
}








//  515. Find Largest Value in Each Tree Row

