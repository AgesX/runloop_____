//
//  findTarget.swift
//  leetcode
//
//  Created by Jz D on 2021/8/24.
//

import Foundation



// 没有利用条件


class Solution {
    
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
     
        guard let n = root else {
            return false
        }
        
        var queue = [n]
        var vals: [Int: Int] = [n.val: 1]
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            if let lhs = node.left{
                queue.append(lhs)
                let scalar = vals[lhs.val] ?? 0
                vals.updateValue(scalar + 1, forKey: lhs.val)
            }
            if let rhs = node.right{
                queue.append(rhs)
                let scalar = vals[rhs.val] ?? 0
                vals.updateValue(scalar + 1, forKey: rhs.val)
            }
        }
        for pair in vals{
            
            let left = k - pair.key
            if vals.keys.contains(left){
                if left == pair.key{
                    if pair.value > 1{
                        return true
                    }
                }
                else{
                    return true
                }
            }
        }
        return false
    }
    

    
    
    
    
}






//  
