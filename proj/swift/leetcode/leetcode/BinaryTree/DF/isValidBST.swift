//
//  isValidBST.swift
//  leetcode
//
//  Created by Jz D on 2021/9/9.
//

import Foundation




//  98. Validate Binary Search Tree

class Solution_isValidBST{
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let node = root else {
            return false
        }
        let arr = isValidBST_X(root: node)
        let cnt = arr.count
        guard cnt > 1 else {
            return true
        }
        var i = 0
        while i <  cnt - 1  {
            if arr[i] >= arr[i + 1]{
                return false
            }
            i += 1
        }
        return true
    }
    
    
    func isValidBST_X(root node: TreeNode) -> [Int] {
        var result = [Int]()
        if let lhs = node.left{
            result.append(contentsOf: isValidBST_X(root: lhs))
        }
        result.append(node.val)
        if let rhs = node.right{
            result.append(contentsOf: isValidBST_X(root: rhs))
        }
        return result
    }
}








class Solution_isValidBST_wrong {
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let node = root else {
            return false
        }
        return isValidBST_X(root: node)
    }
    
    
    func isValidBST_X(root node: TreeNode) -> Bool {
        if let lhs = node.left{
            if node.val <= lhs.val{
                return false
            }
            else{
                if isValidBST(lhs) == false{
                    return false
                }
            }
        }
        if let rhs = node.right{
            if node.val >= rhs.val{
                return false
            }
            else{
                if isValidBST(rhs) == false{
                    return false
                }
            }
        }
        return true
    }
}






