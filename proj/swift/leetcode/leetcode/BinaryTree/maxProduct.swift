//
//  maxProduct.swift
//  leetcode
//
//  Created by Jz D on 2021/8/20.
//

import Foundation




//  当然是，深度优先


class Solution_maxProduct {
    
    var result = 0
    
    func maxProduct(_ root: TreeNode?) -> Int {
        guard let node = root else{
            return 0
        }
        // 先来一个广度优先
        var queue: [TreeNode] = [node]
        var total: Int = 0
        while queue.isEmpty == false {
            let n = queue.removeFirst()
            total += n.val
            if let lhs = n.left{
                queue.append(lhs)
            }
            if let rhs = n.right{
                queue.append(rhs)
            }
            
        }
        guard total > 0 else {
            return 0
        }
        maxProduct(root, sum: total)
        return result % (1000_000_000 + 7)
    }
    
    //  763478770
    
    func maxProduct(_ root: TreeNode?, sum total: Int) -> Int {
        guard let n = root else {
            return 0
        }
        var left = 0
        var right = 0
        if let lhs = n.left{
            left = maxProduct(lhs, sum: total)
            result = max(result, (total - left) * left)
        }
        
        if let rhs = n.right{
            right = maxProduct(rhs, sum: total)
            result = max(result, (total - right) * right)
        }
        return left + right + n.val
        
    }
    
    
    
}



extension Solution_maxProduct{
    
    
    func test(){
        
        
        
        var arr = [1,2,3,4,5,6]
        arr = [2,3,9,10,7,8,6,5,4,11,1]
        arr = [1,1]




        let node = arr.arrayToTree()

        // print(node)


        print("\n\n\n")


        var info: [Int?] = [1,nil,2,3,4,nil,nil,5,6]

        info = arrXx
        let star = info.arrayDenseToNode()

        print(star ?? "哈哈")

        let result = Solution_maxProduct().maxProduct(star)

        print(result)

        
        
    }
    
    
}




//  1339. Maximum Product of Splitted Binary Tree
