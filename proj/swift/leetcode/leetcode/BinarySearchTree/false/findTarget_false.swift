//
//  findTarget_false.swift
//  leetcode
//
//  Created by Jz D on 2021/8/24.
//

import Foundation



class Solution_findTarget_hehe {
    
    
    var result = false
    
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let n = root else {
            return false
        }
        let val = n.val
        let target = k - val
        if find(target: n.left, target){
            return true
        }
        if find(target: n.right, target){
            return true
        }
        if findTarget(n.left, k){
            return true
        }
        if findTarget(n.right, k){
            return true
        }
        return result
    }
    
    
    func find(target root: TreeNode?, _ k: Int) -> Bool {
        guard result == false else {
            return true
        }
        guard let n = root else {
            return false
        }
        let val = n.val
        if val == k{
            result = true
            return true
        }
        else if k < val{
            return find(target: n.left, k)
        }
        else{
            return find(target: n.right, k)
        }
    }
}

