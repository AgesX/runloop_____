//
//  generateTrees.swift
//  leetcode
//
//  Created by Jz D on 2021/8/17.
//

import Foundation







class Solution_generateTrees{
    
    
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n > 0 else {
            return []
        }
        return generateTrees(left: 1, right: n)
    }
    
    
    
    func generateTrees(left lhs: Int, right rhs: Int) -> [TreeNode?]{
        guard lhs < rhs else {
            if lhs == rhs{
                return [TreeNode(lhs)]
            }
            else{
                return []
            }
        }
        var result: [TreeNode?] = []
        var i = lhs
        
        while i <= rhs {
            var lhsArr = [TreeNode?]()
            var rhsArr = [TreeNode?]()
            if i > lhs{
                lhsArr = generateTrees(left: lhs, right: i - 1)
            }
            if i < rhs{
                rhsArr = generateTrees(left: i + 1, right: rhs)
            }
            let leftSum = lhsArr.count
            let rightSum = rhsArr.count
            
            
            // 保证二叉树，有序， BST
            
            // 因为下面的操作，就是默认有序的
            
            switch (leftSum > 0, rightSum > 0) {
            case (true, true):
                // 这个是，主要流程
                var kkk = 0
                while kkk < leftSum {
                    var mmm = 0
                    while mmm < rightSum {
                        let node = TreeNode(i)
                        node.left = lhsArr[kkk]
                        node.right = rhsArr[mmm]
                        mmm += 1
                        result.append(node)
                    }
                    kkk += 1
                }
            case (true, false):
                // 边界处理， 1
                var hhh = 0
                while hhh < leftSum {
                    let node = TreeNode(i)
                    node.left = lhsArr[hhh]
                    node.right = nil
                    hhh += 1
                    result.append(node)
                }
            case (false, true):
                // 边界处理， 2
                var jjj = 0
                while jjj < rightSum {
                    let node = TreeNode(i)
                    node.left = nil
                    node.right = rhsArr[jjj]
                    jjj += 1
                    result.append(node)
                }
            default:
                fatalError("ha ha ha")
            }
            
            i += 1
        }
        
        return result
    }
}










extension Solution_generateTrees{
    
    
    func test(){
        
        
        //    中等难度的，就是处理，稍微复杂



        var index = 3
        index = 4

        let result = Solution_generateTrees().generateTrees(index)


        result.forEach { no in
            
            if let nnn = no{
                print(nnn)
            }
            else{
                print("y y y")
            }
            
        }


        
        
        
    }
    
    
    
}


//  95. Unique Binary Search Trees II






