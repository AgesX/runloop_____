



import Foundation











class Solution_uniquePaths{
    
    // 这个是顺推
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        guard m > 0, n > 0 else {
            return 0
        }
        var container = [[Int]](repeating: [Int](repeating: 1, count: n), count: m)
        
        var i = 1
        while i < m {
            var j = 1
            while j < n {
                container[i][j] = container[i - 1][j] + container[i][j - 1]
                j += 1
            }
            i += 1
        }
        return container[m - 1][n - 1]
    }
    
    

}









let result = Solution().Solution_uniquePaths(3, 2)


print(result)











class Solution_uniquePaths_Time_Limit{
    
    // 这个是逆推
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





extension Solution_uniquePaths_Time_Limit{

    
    func test(){
        
        let result = Solution_uniquePaths_Time_Limit().uniquePaths(3, 2)


        print(result)


    }
    
    
}





print("\n\n\n")



