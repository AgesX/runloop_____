//
//  diameterOfBinaryTree.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation







// 543. Diameter of Binary Tree

class diameterOfBinaryTree{
class Solution {
    
    
    var result = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let n = root else{
            return 0
        }
        dfsBinaryTree(n)
        return result
    }
    
    func dfsBinaryTree(_ root: TreeNode) -> (Int, Int) {
        var final = (0, 0)
        if let lhs = root.left{
            let left = dfsBinaryTree(lhs)
            final.0 = max(left.0, left.1) + 1
        }
        if let rhs = root.right{
            let right = dfsBinaryTree(rhs)
            final.1 = max(right.0, right.1) + 1
        }
        result = max(result, final.0 + final.1)
       // print(final)
        return final
    }
    
    
    
    
    func test(){
        
        var arr:[Int?] = [1,2,3,4,5]
        // arr = [1, 2, nil , 3]

        let node = arr.arrayDenseToNode()

        let result = Solution().diameterOfBinaryTree(node)


        print(result)

    }
}




//


//



/*
 
 
 
func user_case(){
    
    let arr = [4,-7,-3,null,null,
               -9,-3,9,-7,-4,
               null,6,null,-6,-6,
               null,null, 0,6,5,
               null,9,null, null,-1,
               -4,null,null,null,-2]


    print(arr.arrayDenseToNode() ?? " - ")




}


 
*/


}
