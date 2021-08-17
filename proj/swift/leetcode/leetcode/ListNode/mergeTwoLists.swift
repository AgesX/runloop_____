//
//  main.swift
//  leetcode
//
//  Created by Jz D on 2021/8/12.
//

import Foundation





class Solution_two {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let dummy = ListNode()
        
        var lhs = l1
        var rhs = l2
        var cur: ListNode? = dummy
        while lhs != nil , rhs != nil {
            if let left = lhs, let right = rhs{
                if left.val > right.val{
                    cur?.next = right
                    rhs = right.next
                }
                else{
                    cur?.next = left
                    lhs = left.next
                }
                cur = cur?.next
            }
        }
    //    print(dummy.next?.desp ?? "ha ")
        if lhs != nil{
            cur?.next = lhs
        }
        else if rhs != nil{
            cur?.next = rhs
        }
        return dummy.next
    }
    
    
    func test(){
        let one = ListNode(5)

        let two = ListNode(8)


        let three = ListNode(1)

        let four = ListNode(9)

        let five = ListNode(99)

        var lhs = one
        lhs.next = two


        //

        // lhs = ListNode(array: [1, 2, 4])

        //


        var rhs = three
        three.next = four
        four.next = five


        //

        // rhs = ListNode(array: [1, 3, 4])

        //


        print("lhs:  ", lhs.desp)


        print("rhs:  ", rhs.desp)

        print("\n\n\n")

        let result = Solution_two().mergeTwoLists(lhs, rhs)


        print(result?.desp ?? "哈哈哈")
    }
}







// 21. Merge Two Sorted Lists

