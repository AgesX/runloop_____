//
//  pathSum_third.swift
//  leetcode
//
//  Created by Jz D on 2021/9/7.
//

import Foundation






class Solution_pathSum_third{
    
    
    var result = 0
    
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        guard let n = root else {
            return 0
        }
        pathSumX(n, targetSum, carry: [])
        return result
    }
    
    
    
    func pathSumX(_ root: TreeNode, _ targetSum: Int, carry last: [Int]){
        let tmp = (last.map { val in
            val + root.val
        } + [root.val])
        
        // 等于了，再等于
        // 1， -1
        // 1， -1， 1， -1
        
        tmp.forEach({ val in
            if targetSum == val{
                result += 1
            }
        })
        
        if let lhs = root.left{
            pathSumX(lhs, targetSum, carry: tmp)
        }
        if let rhs = root.right{
            pathSumX(rhs, targetSum, carry: tmp)
        }
    }
}



extension Solution_pathSum_third{
    
    
    func test(){
        
        
        
        var root = [1,-2,-3,1,3,-2,null,-1]
        var targetSum = -1

        /*
        do{
            root = [10,5,-3,3,2,null,11,3,-2,null,1]
            targetSum = 8
        }
        */




        let n = root.arrayDenseToNode()

        print(n ?? "  ")


        let result = Solution_pathSum_third().pathSum(n, targetSum)


        print(result)
        
        
    }
    
    
}


//  437. Path Sum III
