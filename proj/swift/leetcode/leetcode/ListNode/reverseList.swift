//
//  reverseList.swift
//  leetcode
//
//  Created by Jz D on 2021/9/7.
//

import Foundation



class Solution_reverseList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var current = head // 1
        var last: ListNode? = nil
        var final: ListNode? = nil
        while current != nil { // 2
            // 注意点，不要放在 cur.next,
            // 要放在 cur
            
            
            let tmp = current?.next // 2 , nil
            current?.next = last
            last = current  // 1 // 2
            if tmp == nil{
                final = current
            }
            current = tmp   // 2
        }
        return final
    }
    
}


extension Solution_reverseList{
    
    func test(){
        
        let node = [1,2].arrayToLinkedList()

        let result = Solution_reverseList().reverseList(node)


        print(result ?? " X ")



    }
    
}




extension Solution_reverseList{
    
    func reverseList_wrong(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var current = head // 1
        var last: ListNode? = nil
        var final: ListNode? = nil
        while current?.next != nil { // 2
            let tmp = current?.next // 2 , nil
            current?.next = last
            last = current  // 1 // 2
            if tmp == nil{
                
                // 这里，走不到啊
                
                final = current
            }
            else{
                current = tmp   // 2
            }
        }
        return final
    }
}




//  Reverse Linked List
