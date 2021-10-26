//
//  invertTree.swift
//  interview
//
//  Created by Jz D on 2021/10/26.
//

import Foundation




class InvertTree{


// 226. Invert Binary Tree

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        let left = root?.left
        let right = root?.right
        if let lhs = left{
            root?.right = invertTree(lhs)
        }
        else{
            root?.right = nil
        }
        if let rhs = right{
            root?.left = invertTree(rhs)
        }
        else{
            root?.right = nil
        }
        return root
    }
}





}
