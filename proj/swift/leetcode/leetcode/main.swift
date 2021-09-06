



import Foundation



class Solution {
    
    
    struct Pos: Hashable {
        let x: Int
        let y: Int
        
        func check(in grid: [[Int]], _ visited: inout Set<Pos>) -> Bool{
            var ok = false
            if grid[x][y] == -1{
                ok = true
                visited.insert(self)
            }
            return ok && !( visited.contains(self) )
        }
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
        return uniquePathsIII(grid, visited: Set([start]), m, n, start, end)
    }
    
    
    
    func uniquePathsIII(_ grid: [[Int]], visited seen: Set<Pos>, _ m: Int, _ n: Int, _ start: Pos, _ end: Pos) -> Int {
        var visited = seen
        var result = 0
        if start.x > 0{
            let left = Pos(x: start.x - 1, y: start.y)
            if left.check(in: grid, &visited){
                var arr = visited
                arr.insert(left)
                result += uniquePathsIII(grid, visited: arr, m, n, left, end)
            }
        }
        if start.x <= m - 2{
            let rhs = Pos(x: start.x + 1, y: start.y)
            if rhs.check(in: grid, &visited){
                var arr = visited
                arr.insert(rhs)
                result += uniquePathsIII(grid, visited: arr, m, n, rhs, end)
            }
        }
        if start.y > 0{
            let up = Pos(x: start.x, y: start.y - 1)
            if up.check(in: grid, &visited){
                var arr = visited
                arr.insert(up)
                result += uniquePathsIII(grid, visited: arr, m, n, up, end)
            }
        }
        if start.y <= n - 2{
            let down = Pos(x: start.x, y: start.y + 1)
            if down.check(in: grid, &visited){
                var arr = visited
                arr.insert(down)
                result += uniquePathsIII(grid, visited: arr, m, n, down, end)
            }
        }
        return 0
    }
}




print("\n\n\n")





// 图，就是树



// 图上面，一般的节点，



// 就是 4 叉树，
// 4 个分支
