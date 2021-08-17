//
//  struct.swift
//  leetcode
//
//  Created by Jz D on 2021/8/17.
//

import Foundation






//  Definition for a binary tree node.



public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    
    
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    
    
}



extension TreeNode: CustomStringConvertible{
    
    public var description: String{
        return diagram(self)
        
    }
    
    
    
    private func diagram(_ node: TreeNode?, _ top: String = "" , _ root: String = "", _ bottom: String = "") -> String{
        guard let node = node else {
            // return root + "nil\n"
            return root + "   空\n"
        }
        if node.left == nil, node.right == nil {
            let str = String(node.val)
            return root + "   \(str)\n"
        }
        let str = String(node.val)
        return diagram(node.right, top + " ", top + "┌──", top + "│ ") + root + " \(str)\n" +  diagram(node.left, bottom + "│ ", bottom + "└──", bottom + " ")
        
    }// diagram will recursively create a string representing the binary tree.
    // To try it out, head back to the playground and write the following:
    
    
    // 右结点 配 "┌──"
    // 左结点 配 "└──"
    
    
    
}






//


//


//



//


//


//







//  Definition for singly-linked list.



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    
    
    init(array arr: [Int]) {
        
        let cnt = arr.count
        var i = 0
        let dummy = ListNode()
        var cur: ListNode? = dummy
        while i < cnt {
            cur?.next = ListNode(arr[i])
            cur = cur?.next
            i += 1
        }
        val = dummy.next?.val ?? -1
        next = dummy.next?.next
        
    }
    
    
}



extension ListNode{
    
    var desp: String{
        var info = String(val)
        var cur = self
        while let node = cur.next{
            info += " -> \(node.val)"
            cur = node
        }
        return info
    }
    
}







//


//


//



//


//


//
