



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
        
        let validK = k % cnt
        
        guard validK > 0 else {
            return n
        }
        let dummy = ListNode(0)
        dummy.next = head
        var curLast: ListNode? = dummy
        cnt = 0
        while cnt < validK {
            curLast = curLast?.next
            cnt += 1
        }
        
        

        if let result = curLast?.next?.next{
            curLast?.next?.next = nil
            end?.next = head
            return result
        }
        else{
            let dummyTwo = ListNode(0)
            dummyTwo.next = head
            var curLastTwo: ListNode? = dummyTwo
            end?.next = head
            cnt = 0
            while cnt < validK {
                curLastTwo = curLastTwo?.next
                cnt += 1
            }
            let result = curLastTwo?.next?.next?.next
            curLastTwo?.next?.next?.next = nil
            return result
        }
    }
}




var arr = [1,2,3]

// arr = [1,2]

arr = [1,2,3,4,5]

let input = arr.arrayToLinkedList()

print(input)

let output = Solution().rotateRight(input, 1)


print(output ?? " x x ")


print("\n\n\n")




