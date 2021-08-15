//
//  invertTree_.swift
//  leetcode
//
//  Created by Jz D on 2021/8/15.
//

import Foundation



class Solution_Tree {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        
        
        guard let node = root else {
            return nil
        }
        let left = node.left
        let right = node.right
        
        node.right = invertTree(left)
        
        node.left = invertTree(right)
        
        
        return node
    }
}




extension Solution_Tree{
    
    
    func test(){
        var one = TreeNode(1)
        var two = TreeNode(2)
        var three = TreeNode(3)
        var four = TreeNode(4)


        one.left = two
        one.right = three

        two.right = four


        print(one)


        let result = Solution_Tree().invertTree(one)


        print(result ?? "Cha")



        //  226. Invert Binary Tree

    }
}
