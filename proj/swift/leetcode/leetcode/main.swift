



import Foundation




class Solution {
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
 
        let dummy = ListNode()
        dummy.next = head
        
        
        var i = 0
        var cur = head
        
        // 简单设置，调整
        // 规避情况判断
        var target: ListNode? = dummy
        
        while cur != nil {
            
            if i >= n{
                target = target?.next
            }
            i += 1
            cur = cur?.next
        }
      //  print(target ?? "x x ")
        
        let tmp = target?.next
        target?.next = tmp?.next
        tmp?.next = nil
        
        
        return dummy.next
    }
}







var arr = [1,2,3,4,5]
var len = 2



arr = [1]

arr = [1, 1]

len = 1

let node = arr.arrayToLinkedList()
print(node)


print("\n\n\n")


let result = Solution().removeNthFromEnd(node, len)


print(result ?? "66")

