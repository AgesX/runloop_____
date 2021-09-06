



import Foundation



class Solution {
    
    
    struct Pos: Hashable {
        let x: Int
        let y: Int
    }
    
    
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        let m = grid.count
        guard m > 0 else {
            return 0
        }
        let n = grid[0].count
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
        return uniquePathsIII(grid, Set([start]), m, n, end)
    }
    
    
    
    func uniquePathsIII(_ grid: [[Int]], _ visited: Set<Pos>, _ m: Int, _ n: Int, _ end: Pos) -> Int {
        
        
        
        
        return 0
    }
}




print("\n\n\n")



