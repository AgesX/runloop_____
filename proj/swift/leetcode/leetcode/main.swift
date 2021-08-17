



import Foundation



class Solution {
    
    
    var result = 1
    
    
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        // 只有有节点， root 绝对 ok
        goodNodes(node: node, max: node.val)
        return result
        
    }
    
    
    
    
    func goodNodes(node root: TreeNode, max maxVal: Int){
      
        if let lhs = root.left{
            if lhs.val >= maxVal{
                result += 1
            }
            let val = max(maxVal, lhs.val)
            goodNodes(node: lhs, max: val)
        }
        
        
        if let rhs = root.right{
            if rhs.val >= maxVal{
                result += 1
            }
            let val = max(maxVal, rhs.val)
            goodNodes(node: rhs, max: val)
        }
        
        
    }
}






let arr: [Int?] = [3,1,4,3, nil,1,5]

let node = arr.arrayToTree()

let result = Solution().goodNodes(node)


print(result)




print("\n\n\n")



//  1448. Count Good Nodes in Binary Tree
