



import Foundation







class Solution {
    
    
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        var result: [TreeNode?] = []
        guard n > 0 else {
            return result
        }
        var i = 1
        while i <= n {
            let root = TreeNode(i)
            
            
            
            
            
            
            result.append(root)
            
        }
        
        
        
        
        return result
    }
    
    
    
    func generateTrees(left lhs: Int, right rhs: Int) -> [Int?]{
        guard lhs <= rhs else {
            if lhs == rhs{
                return [lhs]
            }
            else{
                return []
            }
        }
        var result: [Int?] = []
        var i = lhs
        
        while i <= rhs {
            let node = TreeNode(i)
            if i > lhs{
                let lhsArr = generateTrees(left: lhs, right: i - 1)
                
                
            }
            
            
            if i < rhs{
                let rhsArr = generateTrees(left: i + 1, right: rhs)
                
                
            }
            
            
            
        }
        
        
        
        
        
        return result
    }
}



























print("\n\n\n")



