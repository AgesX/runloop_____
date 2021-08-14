
import Foundation




class Solution {
    
    
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
}




let one = ListNode(array: [1,1,2,3,3])

let result = Solution().deleteDuplicates(one)


print(result?.desp ?? "X x _")
