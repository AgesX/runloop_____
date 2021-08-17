



import Foundation







class Solution {
    
    
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n > 0 else {
            return []
        }
        return generateTrees(left: 0, right: n)
    }
    
    
    
    func generateTrees(left lhs: Int, right rhs: Int) -> [TreeNode?]{
        guard lhs < rhs else {
            if lhs == rhs{
                return [TreeNode(lhs)]
            }
            else{
                return []
            }
        }
        var result: [TreeNode?] = []
        var i = lhs
        
        while i <= rhs {
            var lhsArr = [TreeNode?]()
            var rhsArr = [TreeNode?]()
            if i > lhs{
                lhsArr = generateTrees(left: lhs, right: i - 1)
            }
            if i < rhs{
                rhsArr = generateTrees(left: i + 1, right: rhs)
            }
            let leftSum = lhsArr.count
            let rightSum = rhsArr.count
            switch (leftSum > 0, rightSum > 0) {
            case (true, true):
                var kkk = 0
                while kkk < leftSum {
                    var mmm = 0
                    while mmm < rightSum {
                        let node = TreeNode(i)
                        node.left = lhsArr[kkk]
                        node.right = rhsArr[kkk]
                        mmm += 1
                        result.append(node)
                    }
                    kkk += 1
                }
            case (true, false):
                var hhh = 0
                while hhh < leftSum {
                    let node = TreeNode(i)
                    node.left = lhsArr[hhh]
                    node.right = nil
                    hhh += 1
                    result.append(node)
                }
            case (false, true):
                var jjj = 0
                while jjj < rightSum {
                    let node = TreeNode(i)
                    node.left = nil
                    node.right = rhsArr[jjj]
                    jjj += 1
                    result.append(node)
                }
            default:
                fatalError("ha ha ha")
            }
            
            
            i += 1
        }
        
        
        
        
        
        return result
    }
}





//    中等难度的，就是处理，稍微复杂





















print("\n\n\n")



