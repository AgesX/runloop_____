



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
        guard queue.isEmpty == false else {
            return false
        }
        let node = queue.arrayDenseToNodePre()
        print(node ?? " _ ")
        
        return true
    }
}





var input = "9,3,4,#,#,1,#,#,2"


// input = "9,3,4,#,#,1,#,#"







Solution().isValidSerialization(input)







print("\n\n\n")



