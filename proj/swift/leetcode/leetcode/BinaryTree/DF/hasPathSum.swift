//
//  hasPathSum.swift
//  leetcode
//
//  Created by Jz D on 2021/9/7.
//

import Foundation





class Solution_hasPathSum {
    
    
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let n = root else {
            return false
        }
        return xPathSum(n, targetSum)
    }
    
    
    func xPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let n = root else {
            return targetSum == 0
        }
        let tmp = targetSum - n.val
        if hasPathSum(n.left, tmp){
            return true
        }
        if hasPathSum(n.right, tmp){
            return true
        }
        return tmp == 0 && n.left == nil && n.right == nil
    }
}







extension Solution_hasPathSum{
    
    
    func test(){
        
        
        
        var root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22






        targetSum = 1

        do{
            root = [-2,null,-3]
            targetSum = -5
        }


        var node = root.arrayToTree()

        /*
        do{
            let arr: [Int?] = [1,2]

            node = arr.arrayDenseToNode()
        }
        */


        let result = Solution_hasPathSum().hasPathSum(node, targetSum)

        print(result)




        
        
        
    }
    
    
}




//  112. Path Sum

