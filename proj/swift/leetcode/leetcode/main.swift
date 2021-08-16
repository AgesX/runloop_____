
import Foundation





class Solution {
    
    var visited = Set<String>()
    
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var result: Int = 0
        
        let height = grid.count
        guard height > 0 else {
            return result
        }
        
        let width = grid[0].count
        
        guard width > 0 else {
            return result
        }
        
        var i = 0
        var j = 0
        
        var queue = [(Int, Int)]()
        Outer: while i < height {
            while j < width {
                if grid[i][j] == 1{
                    let key = "\(i)_\(j)"
                    visited.insert(key)
                    queue.append((i, j))
                    result += 4
                    break Outer
                }
                j += 1
            }
            i += 1
        }
                
        while queue.isEmpty == false {
            let pop = queue.removeFirst()
            let ii = pop.0
            let jj = pop.1
            
            if ii >= 1, ii < height{
                let up = grid[ii - 1][jj]
                let key = "\(ii - 1)_\(jj)"
                if visited.contains(key) == false, up == 1{
                    visited.insert(key)
                    result += 2
                    
                    // result += 4 - 2
                    // 一个 dot, 四条边
                    // 减去两个 dot 的共有边， 1 + 1
                    queue.append((ii - 1, jj))
                }
            }
            if ii >= 0, ii < height - 1{
                let down = grid[ii + 1][jj]
                let key = "\(ii + 1)_\(jj)"
                if visited.contains(key) == false, down == 1{
                    visited.insert(key)
                    result += 2
                    queue.append((ii + 1, jj))
                }
            }
            if jj >= 1, jj < width{
                let lhs = grid[ii][jj - 1]
                let key = "\(ii)_\(jj - 1)"
                if visited.contains(key) == false, lhs == 1{
                    visited.insert(key)
                    result += 2
                    queue.append((ii, jj - 1))
                }
            }
            
            if jj >= 1, jj < width - 1{
                let rhs = grid[ii][jj + 1]
                let key = "\(ii)_\(jj + 1)"
                if visited.contains(key) == false, rhs == 1{
                    visited.insert(key)
                    result += 2
                    queue.append((ii, jj + 1))
                }
            }
            
        }
     //   print(visited)
        
        return result
    }
}







let hahaha = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]


let result = Solution().islandPerimeter(hahaha)


print(result)












print("\n\n\n")
