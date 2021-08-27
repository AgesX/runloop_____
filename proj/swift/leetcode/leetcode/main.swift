



import Foundation









class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        var queue = [Int?]()
        for char in preorder{
            switch char {
            case ",":
                ()
            case "#":
                queue.append(nil)
            default:
                if let val = Int(String(char)){
                    queue.append(val)
                }
            }
        }
        let node = queue.arrayDenseToNodePre()
        print(node ?? " _ ")
        return queue.arrayCheckNodePre
    }
}






var input = "9,3,4,#,#,1,#,#,2"

input = "9,3,4,#,#,1,#,#,2,#,6,#,#"

input = "1,#"

input = "9,#,#,1"

input = "1"

input = "9,3,4,#,#,1,#,#,2,#,6,#,#"

input = "1,#,#"

print(Solution().isValidSerialization(input))









Web().test()











//  331. Verify Preorder Serialization of a Binary Tree




print("\n\n\n")



