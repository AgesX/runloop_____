//
//  util.swift
//  leetcode
//
//  Created by Jz D on 2021/8/17.
//

import Foundation




extension Array where Element == Int{
    
    func arrayToTree() -> TreeNode{

        
        var nodes = [TreeNode]()
        for num in 0..<self.count{
            nodes.append(TreeNode(self[num]))
        }
        
        
        var i = 0
        repeat{
            nodes[i].left = nodes[2 * i + 1]
            nodes[i].right = nodes[2 * i + 2]
            i+=1
        }while i < (self.count)/2
 
        return nodes.first!
    }
    
    
    func arrayToLinkedList() -> ListNode{
        
        
        var nodes = [ListNode]()
        for num in 0..<self.count{
            nodes.append(ListNode(self[num]))
        }
        
        for i in 0...self.count-2{
            nodes[i].next = nodes[i+1]
        }
        return nodes.first!
    }
    
    
}






extension Array where Element == Int?{
    
    func arrayToTree() -> TreeNode?{
        
        
        var nodes = [TreeNode?]()
        for num in 0..<count{
            if let val = self[num]{
                nodes.append(TreeNode(val))
            }
            else{
                nodes.append(nil)
            }
        }
        
        
        var i = 0
        repeat{
            nodes[i]?.left = nodes[2 * i + 1]
            nodes[i]?.right = nodes[2 * i + 2]
            i+=1
        }while i < (self.count)/2
        
        return nodes.first!
    }
    
    
}
