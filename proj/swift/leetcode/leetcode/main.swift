



import Foundation



class Solution {
    
    
    
    var map = [[Int]]()
    
    struct Pos {
        let x: Int
        let y: Int
    }
    
    
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        var m = grid.count
        guard m > 0 else {
            return 0
        }
        var n = grid[0].count
        guard n > 0 else {
            return 0
        }
        var begin: Pos? = nil
        var final: Pos? = nil
        for i in 0..<m{
            for j in 0..<n{
                switch grid[i][j] {
                case 1:
                    begin = Pos(x: i, y: j)
                case 2:
                    final = Pos(x: i, y: j)
                default: ()
                }
            }
        }
        guard let start = begin, let end = final else {
            return 0
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        return 0
    }
}




print("\n\n\n")



