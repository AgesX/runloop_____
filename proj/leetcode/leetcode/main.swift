//
//  main.swift
//  leetcode
//
//  Created by Jz D on 2021/8/12.
//

import Foundation



//  Definition for singly-linked list.



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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





class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let dummy = ListNode()
        
        var lhs = l1
        var rhs = l2
        var cur: ListNode? = dummy
        while lhs?.next != nil , rhs?.next != nil {
            
            if let left = lhs, let right = rhs{
                
                if left.val > right.val{
                    cur?.next = right
                    rhs = right.next
                }
                else{
                    cur?.next = left
                    lhs = left.next
                }
            }
            cur = cur?.next
        }
        
        return dummy.next
    }
}



let one = ListNode(5)

let two = ListNode(8)


let three = ListNode(1)

let four = ListNode(8)

let five = ListNode(99)

var lhs = one
lhs.next = two


var rhs = three
three.next = four
four.next = five


print("lhs:  ", lhs.desp)


print("rhs:  ", rhs.desp)

print("\n\n\n")

let result = Solution().mergeTwoLists(lhs, rhs)


print(result?.desp ?? "哈哈哈")
