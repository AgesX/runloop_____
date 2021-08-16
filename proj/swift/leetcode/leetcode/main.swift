
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
        
        while i < height {
            while j < width {
                let key = "\(i)_\(j)"
                if grid[i][j] == 1, visited.contains(key) == false{
                    
                        visited.insert(key)
                    
                }
                
                
                j += 1
            }
            
            i += 1
        }
        
        
        
        
        
        
        return result
    }
}












print("\n\n\n")
