



import Foundation






class Solution_uniquePaths_Time_Limit{
    

    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        let x = m - 1
        let y = n - 1
        guard !(m == 1 && n == 1) else {
            return 1
        }
        var result = 0
        
        
        if x >= 1{
            // up
            result += childPaths(x - 1, y)
        }
        if y >= 1{
            // left
            result += childPaths(x, y - 1)
        }
        
        return result
    }
    
    
    
    func childPaths(_ x: Int, _ y: Int) -> Int {
        guard !(x == 0 && y == 0) else {
            return 1
        }
        var result = 0
        
        if x >= 1{
            // up
            result += childPaths(x - 1, y)
        }
        if y >= 1{
            // left
            result += childPaths(x, y - 1)
        }
        
        return result
    }
}



let result = Solution_uniquePaths_Time_Limit().uniquePaths(3, 2)


print(result)




print("\n\n\n")



