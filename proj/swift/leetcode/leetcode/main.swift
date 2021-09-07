


import Foundation





class Solution_levelOrder {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        
        guard let n = root else {
            return result
        }
        
        var queue: [TreeNode] = [n]
        while queue.isEmpty == false {
            var levelQ = queue
            var levelVals = [Int]()
            var nextQ = [TreeNode]()
            while levelQ.isEmpty == false {
                let node = levelQ.removeFirst()
                if let lhs = node.left{
                    nextQ.append(lhs)
                }
                if let rhs = node.right{
                    nextQ.append(rhs)
                }
                levelVals.append(node.val)
            }
            queue = nextQ
            result.append(levelVals)
        }
        
        return result
    }
    
}





// 102. Binary Tree Level Order Traversal





print("\n\n\n")

