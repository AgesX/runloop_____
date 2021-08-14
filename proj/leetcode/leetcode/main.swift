
import Foundation





//  Definition for a binary tree node.



public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    
    
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    
    
}



extension TreeNode: CustomStringConvertible{
    
    public var description: String{
        return diagram(self)
        
    }
    
    
    
    private func diagram(_ node: TreeNode?, _ top: String = "" , _ root: String = "", _ bottom: String = "") -> String{
        guard let node = node else {
            // return root + "nil\n"
            return root + "   空\n"
        }
        if node.left == nil && node.right == nil {
            let str = String(node.val)
            return root + "   \(str)\n"
        }
        let str = String(node.val)
        return diagram(node.right, top + " ", top + "┌──", top + "│ ") + root + " \(str)\n" +  diagram(node.left, bottom + "│ ", bottom + "└──", bottom + " ")
        
    }// diagram will recursively create a string representing the binary tree.
    // To try it out, head back to the playground and write the following:
    
    
    // 右结点 配 "┌──"
    // 左结点 配 "└──"
    
    
    
}







class Solution {
    
    
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        let cnt = nums.count
        guard cnt > 0 else {
            return nil
        }
        let mid = cnt/2
        let result = TreeNode(nums[mid])
        if mid > 0{
            result.left = sortedArrayToBST(Array(nums[0..<mid]))
        }
        if mid < cnt - 1{
            result.right = sortedArrayToBST(Array(nums[(mid + 1)..<cnt]))
        }
        
        return result
    }
    
    
    
    
    
}





let arr = [-10,-3,0,5,9]

var result = Solution().sortedArrayToBST(arr)


print(result ?? "    __ ")
