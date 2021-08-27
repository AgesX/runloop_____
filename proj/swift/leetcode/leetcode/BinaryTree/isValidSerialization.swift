//
//  isValidSerialization.swift
//  leetcode
//
//  Created by Jz D on 2021/8/27.
//

import Foundation





class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        let nodes = preorder.components(separatedBy: ",")
        var diff = 1
        for node in nodes{
            diff -= 1
            if diff < 0{
                return false
            }
            if node != "#"{
                diff += 2
            }
        }
        
        return diff == 0
        
        
    }
}











//  331. Verify Preorder Serialization of a Binary Tree

