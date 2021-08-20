//
//  deleteDuplicates.swift
//  leetcode
//
//  Created by Jz D on 2021/8/14.
//

import Foundation





class Solution_B {
    
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
 
        var cur = head
        
        while let current = cur{
            
            while let next = cur?.next, next.val == current.val{
                cur?.next = cur?.next?.next
            }
            cur = cur?.next
        }
        
        return head
    }
    
    
    
    
    
    
    
    
    func test(){
        let one = ListNode(array: [1,1,2,3,3])

        let result = Solution_B().deleteDuplicates(one)


        print(result ?? "X x _")
    }
}





