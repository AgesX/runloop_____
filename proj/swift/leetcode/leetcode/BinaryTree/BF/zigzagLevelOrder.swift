//
//  zigzagLevelOrder.swift
//  leetcode
//
//  Created by Jz D on 2021/9/7.
//

import Foundation




let null:Int? = nil


class Solution_zigzagLevelOrder {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        guard let n = root else {
            return result
        }
        var queue = [n]
        var lhsVisit = true
        while queue.isEmpty == false {
            var levelQueue = queue
            var levelVals = [Int]()
            var nextQueue = [TreeNode]()
            while levelQueue.isEmpty == false{
                let node = levelQueue.removeFirst()
                if let lhs = node.left{
                    nextQueue.append(lhs)
                }
                if let rhs = node.right{
                    nextQueue.append(rhs)
                }
                levelVals.append(node.val)
            }
            if lhsVisit{
                result.append(levelVals)
            }
            else{
                result.append(levelVals.reversed())
            }
            
            queue = nextQueue
            lhsVisit.toggle()
        }
        
        return result
    }
}





extension Solution_zigzagLevelOrder{
    
    
    func test(){
        
        
        var arr: [Int?] = [3,9,20,null,null,15,7]

        // arr = [1,2,3,4,null,null,5]

        let node = arr.arrayDenseToNode()


        let result = Solution_zigzagLevelOrder().zigzagLevelOrder(node)


        print(result)


        
    }
    
    
    
    
}

//  103. Binary Tree Zigzag Level Order Traversal


