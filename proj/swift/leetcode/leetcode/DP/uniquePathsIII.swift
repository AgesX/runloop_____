//
//  uniquePathsIII.swift
//  leetcode
//
//  Created by Jz D on 2021/9/6.
//

import Foundation



struct Pos: Hashable {
    let x: Int
    let y: Int
}




extension Pos{
    
    func check(in grid: [[Int]], _ visited: inout Set<Pos>) -> Bool{
        var ok = true
        if grid[x][y] == -1{
            ok = false
            visited.insert(self)
        }
        return ok && !( visited.contains(self) )
    }
}





extension Pos{
    
    var lhs: Pos{
        Pos(x: x - 1, y: y)
    }
    
    var rhs: Pos{
        Pos(x: x + 1, y: y)
    }
    
    var up: Pos{
        Pos(x: x, y: y - 1)
    }
    
    var down: Pos{
        Pos(x: x, y: y + 1)
    }
    
}





extension Pos{
    
    func hitOne(in grid: [[Character]]) -> Bool{
        return grid[x][y] == "1"
    }
}





class Solution_uniquePathsIII {
    
    
    
    
    
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
        print(start, end)
        return uniquePathsIII(grid, visited: Set([start]), m, n, start, end)
    }
    
    
    
    func uniquePathsIII(_ grid: [[Int]], visited seen: Set<Pos>, _ m: Int, _ n: Int, _ start: Pos, _ end: Pos) -> Int {
        guard start != end else {
           // print(seen.count)
            if seen.count == m * n{
                return 1
            }
            else{
                return 0
            }
        }
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
        return result
    }
}





extension Solution_uniquePathsIII{
    
    
    func test(){
        
        var arr = [[1,0,0,0],[0,0,0,0],[0,0,2,-1]]

        let result = Solution_uniquePathsIII().uniquePathsIII(arr)


        print(result)
        
    }
    
    
}









// ???????????????



// ??????????????????????????????



// ?????? 4 ?????????
// 4 ?????????








//  980. Unique Paths III

//  ??????????????????




// ???????????????????????????????????????

