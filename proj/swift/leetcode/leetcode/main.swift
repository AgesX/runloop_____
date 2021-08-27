



import Foundation







class Solution {
 
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    
        guard let n = head else {
            return nil
        }
        
        var cur = head
        var cnt = 0
        var end: ListNode? = nil
        while cur != nil {
            end = cur
            cur = cur?.next
            cnt += 1
        }
        
        let validK = cnt - k % cnt
        
        guard validK > 0 else {
            return n
        }
        let dummyTwo = ListNode(0)
        dummyTwo.next = head
        var curLastTwo: ListNode? = dummyTwo
        end?.next = head
        cnt = 0
        while cnt < validK {
            curLastTwo = curLastTwo?.next
            cnt += 1
        }
        let result = curLastTwo?.next
        curLastTwo?.next = nil
        return result
    }
}



//  61. Rotate List

var arr = [1,2,3]

// arr = [1,2]

arr = [1,2,3,4,5]

let input = arr.arrayToLinkedList()

print(input)

let output = Solution().rotateRight(input, 1)


print(output ?? " x x ")


print("\n\n\n")




