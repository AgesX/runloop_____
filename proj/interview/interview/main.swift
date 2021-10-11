//
//  main.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation



//  Definition for a binary tree node.


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





class Solution {
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let n = root else{
            return 0
        }
        return dfsBinaryTree(n.left) + dfsBinaryTree(n.right)
    }
    
    func dfsBinaryTree(_ root: TreeNode?) -> Int {
        guard let n = root else { return 0 }
        return max(dfsBinaryTree(n.left), dfsBinaryTree(n.right)) + 1
    }
    
}


