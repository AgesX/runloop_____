
import Foundation


class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        
        
        guard let node = root else {
            return nil
        }
        let left = node.left
        let right = node.right
        
        node.right = invertTree(left)
        
        node.left = invertTree(right)
        
        
        return node
    }
}




var one = TreeNode(1)
var two = TreeNode(2)
var three = TreeNode(3)
var four = TreeNode(4)


one.left = two
one.right = three

two.right = four


print(one)


let result = Solution().invertTree(one)


print(result ?? "Cha")



//  226. Invert Binary Tree
