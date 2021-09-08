//
//  rightSideView.swift
//  leetcode
//
//  Created by Jz D on 2021/9/8.
//

import Foundation







class Solution_rightSideView {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let n = root else {
            return []
        }
        var result = [Int]()
        var levelQ = [n]
        while levelQ.isEmpty == false {
            var nextQ = [TreeNode]()
            if let last = levelQ.last{
                result.append(last.val)
            }
            while levelQ.isEmpty == false {
                let first = levelQ.removeFirst()
                if let lhs = first.left{
                    nextQ.append(lhs)
                }
                if let rhs = first.right{
                    nextQ.append(rhs)
                }
            }
            levelQ = nextQ
        }
        return result
    }
}



extension Solution_rightSideView{
    
    
    func test(){
        
        let arr: [Int?] = [1,2,3,null,5,null,4]


        let result = Solution_rightSideView().rightSideView(arr.arrayDenseToNode())

        print(result)
        
    }
    
    
}








//  199. Binary Tree Right Side View

