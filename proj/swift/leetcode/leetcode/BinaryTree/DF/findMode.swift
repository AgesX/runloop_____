//
//  findMode.swift
//  leetcode
//
//  Created by Jz D on 2021/9/9.
//

import Foundation








class Solution_findMode {
    func findMode(_ root: TreeNode?) -> [Int] {
        guard let n = root else {
            return []
        }
        let arr = dfs(root: n)
        var dict = [Int: Int]()
        for ele in arr{
            let val = dict[ele] ?? 0
            dict.updateValue(val + 1, forKey: ele)
        }
        
        var result = [Int]()
        
        for pair in dict{
            let times = pair.value
            let k = pair.key
            if let first = result.first{
                let many = dict[first] ?? 0
                if many < times{
                    result = [k]
                }
                else if many == times{
                    result.append(k)
                }
            }
            else{
                result.append(k)
            }
        }
        return result
    }
    
    
    func dfs(root node: TreeNode) -> [Int] {
        var arr = [Int]()
        if let lhs = node.left{
            arr.append(contentsOf: dfs(root: lhs))
        }
        arr.append(node.val)
        if let rhs = node.right{
            arr.append(contentsOf: dfs(root: rhs))
        }
        return arr
    }
    
    
    
}


// 501. Find Mode in Binary Search Tree




extension Solution_findMode{
    
    func test(){
        
        
        var node = [1,null,2,2].arrayDenseToNode()

        let result = Solution_findMode().findMode(node)


        print(result)

    }
    
    
}
