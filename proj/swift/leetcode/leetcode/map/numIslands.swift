//
//  numIslands.swift
//  leetcode
//
//  Created by Jz D on 2021/9/8.
//

import Foundation





class Solution_Time_numIslands{
    
    
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        guard m > 0 else {
            return 0
        }
        let n = grid[0].count
        guard n > 0 else {
            return 0
        }
        var map = grid
        var result = 0
        var i = 0
        while i < m {
            var j = 0
            while j < n {
                if map[i][j] == "1"{
                    dfs((i, j),by: (m, n), in: &map)
                    result += 1
                }
                j += 1
            }
            i += 1
        }
        
        return result
    }
    
    
    func dfs(_ start: (x: Int, y: Int), by limit: (m: Int, n: Int), in grid: inout [[Character]]){
        let i = start.x
        let j = start.y
        guard i >= 0, i < limit.m, j >= 0, j < limit.n, grid[i][j] == "1" else {
            return
        }
        grid[i][j] = "X"
        dfs((start.x-1, start.y), by: limit, in: &grid)
        dfs((start.x+1, start.y), by: limit, in: &grid)
        dfs((start.x, start.y-1), by: limit, in: &grid)
        dfs((start.x, start.y+1), by: limit, in: &grid)
        
    }
    
    
}










class Solution_Time_Limit_three{
    
    // Time Limit
    
    
    
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        guard m > 0 else {
            return 0
        }
        let n = grid[0].count
        guard n > 0 else {
            return 0
        }
        var lands = Set<Pos>()
        var i = 0
        while i < m {
            var j = 0
            while j < n {
                let cake = Pos(x: i, y: j)
                if grid[i][j] == "1"{
                    lands.insert(cake)
                }
                j += 1
            }
            i += 1
        }
        
        
        
        var result = 0
        
        let haha = lands
        while lands.isEmpty == false {
            print(lands)
            let begin = lands.removeFirst()
            print(begin)
            var queue = [begin]
            while queue.isEmpty == false {
                let first = queue.removeFirst()
                if first.x > 0{
                    let lhs = first.lhs
                    if lands.contains(lhs), lhs.hitOne(in: grid){
                        lands.remove(lhs)
                        queue.append(lhs)
                    }
                }
                if first.y > 0{
                    let up = first.up
                    if lands.contains(up), up.hitOne(in: grid){
                        lands.remove(up)
                        queue.append(up)
                    }
                }
                if first.x < m - 1{
                    let rhs = first.rhs
                    if lands.contains(rhs), rhs.hitOne(in: grid){
                        lands.remove(rhs)
                        queue.append(rhs)
                    }
                }
                if first.y < n - 1{
                    let down = first.down
                    if lands.contains(down), down.hitOne(in: grid){
                        lands.remove(down)
                        queue.append(down)
                    }
                }
                print(111, lands.symmetricDifference(haha))
            }
            
            result += 1
        }
        return result
    }
    
}


class Solution_Time_Limit_two{
    
    // Time Limit
    
    
    
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        guard m > 0 else {
            return 0
        }
        let n = grid[0].count
        guard n > 0 else {
            return 0
        }
        var lands = Set<Pos>()
        for collect in grid.enumerated(){
            for ele in collect.element.enumerated(){
                let cake = Pos(x: collect.offset, y: ele.offset)
                if ele.element == "1"{
                    lands.insert(cake)
                }
            }
        }
        
        
        var result = 0
        
        let haha = lands
        while lands.isEmpty == false {
            print(lands)
            let begin = lands.removeFirst()
            print(begin)
            var queue = [begin]
            while queue.isEmpty == false {
                let first = queue.removeFirst()
                if first.x > 0{
                    let lhs = first.lhs
                    if lands.contains(lhs), lhs.hitOne(in: grid){
                        lands.remove(lhs)
                        queue.append(lhs)
                    }
                }
                if first.y > 0{
                    let up = first.up
                    if lands.contains(up), up.hitOne(in: grid){
                        lands.remove(up)
                        queue.append(up)
                    }
                }
                if first.x < m - 1{
                    let rhs = first.rhs
                    if lands.contains(rhs), rhs.hitOne(in: grid){
                        lands.remove(rhs)
                        queue.append(rhs)
                    }
                }
                if first.y < n - 1{
                    let down = first.down
                    if lands.contains(down), down.hitOne(in: grid){
                        lands.remove(down)
                        queue.append(down)
                    }
                }
                print(111, lands.symmetricDifference(haha))
            }
            
            result += 1
        }
        return result
    }
    
}


class Solution_numIslands_Time_Limit {
    
    // Time Limit
    
    
    
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        guard m > 0 else {
            return 0
        }
        let n = grid[0].count
        guard n > 0 else {
            return 0
        }
        var hasVisited = Set<Pos>()
        var begin: Pos?
        var result = 0
        repeat{
            begin = nil
            Outer: for collect in grid.enumerated(){
                for ele in collect.element.enumerated(){
                    let cake = Pos(x: collect.offset, y: ele.offset)
                    if hasVisited.contains(cake) == false, ele.element == "1"{
                        begin = cake
                        result += 1
                        break Outer
                    }
                }
            }
            guard let start = begin else{
                return result
            }
            var queue = [start]
            hasVisited.insert(start)
            while queue.isEmpty == false {
                let first = queue.removeFirst()
                if first.x > 0{
                    let lhs = first.lhs
                    if lhs.hitOne(in: grid), hasVisited.contains(lhs) == false{
                        hasVisited.insert(lhs)
                        queue.append(lhs)
                    }
                }
                if first.y > 0{
                    let up = first.up
                    if up.hitOne(in: grid), hasVisited.contains(up) == false{
                        hasVisited.insert(up)
                        queue.append(up)
                    }
                }
                if first.x < m - 1{
                    let rhs = first.rhs
                    if rhs.hitOne(in: grid), hasVisited.contains(rhs) == false{
                        hasVisited.insert(rhs)
                        queue.append(rhs)
                    }
                }
                if first.y < n - 1{
                    let down = first.down
                    if down.hitOne(in: grid), hasVisited.contains(down) == false{
                        hasVisited.insert(down)
                        queue.append(down)
                    }
                }
            }
        }while ( begin != nil )
        return result
    }
    
    
    
    
    
    
    
    
}








extension Solution_Time_numIslands{
    
    
    func test(){
        var grid: [[Character]] = [["1","1","1","1","0"],
                    ["1","1","0","1","0"],
                    ["1","1","0","0","0"],
                    ["0","0","0","0","0"]]


        grid = [["1","1","0","0","0"],
        ["1","1","0","0","0"],
        ["0","0","1","0","0"],
        ["0","0","0","1","1"]]


        let result = Solution_Time_numIslands().numIslands(grid)

        print(result)
    }
    
}





//  200. Number of Islands


