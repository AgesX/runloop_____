//
//  solve.swift
//  leetcode
//
//  Created by Jz D on 2021/9/8.
//

import Foundation




class Solution_solve {
    func solve(_ board: inout [[Character]]) {
        let m = board.count
        guard m > 0 else {
            return
        }
        let n = board[0].count
        guard n > 0 else {
            return
        }
        var map = board
        var i = 0
        let rhsEnd = n - 1
        while i < m {
            if map[i][0] == "O"{
                dfs(start: (i, 0), in: &map, by: (m, n))
            }
            if map[i][rhsEnd] == "O"{
                dfs(start: (i, rhsEnd), in: &map, by: (m, n))
            }
            i += 1
        }
        var j = 0
        let bottomEnd = m - 1
        while j < n {
            if map[0][j] == "O"{
                dfs(start: (0, j), in: &map, by: (m, n))
            }
            if map[bottomEnd][j] == "O"{
                dfs(start: (bottomEnd, j), in: &map, by: (m, n))
            }
            j += 1
        }
        
        map.forEach { arr in
            print(arr)
        }
        
        
        i = 0
        while i < m {
            j = 0
            while j < n {
                if map[i][j] == "O"{
                    // 变更
                    board[i][j] = "X"
                }
                j += 1
            }
            i += 1
        }
    }
    
    
    
    // 标记
    func dfs(start pt: (Int, Int), in grid: inout [[Character]], by limit: (Int, Int)){
        let i = pt.0
        let j = pt.1
        guard i >= 0, i < limit.0, j >= 0, j < limit.1, grid[i][j] == "O" else {
            return
        }
        grid[i][j] = "A"
        dfs(start: (i - 1, j), in: &grid, by: limit)
        dfs(start: (i + 1, j), in: &grid, by: limit)
        dfs(start: (i, j - 1), in: &grid, by: limit)
        dfs(start: (i, j + 1), in: &grid, by: limit)
        
    }
    
}





extension Solution_solve{
    
    
    func test(){
        
        var board: [[Character]] = [["X","X","X","X"],
                                    ["X","O","O","X"],
                                    ["X","X","O","X"],
                                    ["X","O","X","X"]]


        board = [["X","O","X","O","X","O"],
                 ["O","X","O","X","O","X"],
                 ["X","O","X","O","X","O"],
                 ["O","X","O","X","O","X"]]


        Solution_solve().solve(&board)

        print("\n\n\n")

        board.forEach { arr in
            print(arr)
        }


    }
    
    
}



// 130. Surrounded Regions
