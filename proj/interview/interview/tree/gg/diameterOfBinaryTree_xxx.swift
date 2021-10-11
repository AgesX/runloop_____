//
//  diameterOfBinaryTree_xxx.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation





class Solution_wrong {
    
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

