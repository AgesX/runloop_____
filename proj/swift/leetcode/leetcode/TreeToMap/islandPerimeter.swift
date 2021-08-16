//
//  islandPerimeter.swift
//  leetcode
//
//  Created by Jz D on 2021/8/16.
//

import Foundation



import Foundation


enum Direction{
    case up
    case down
    case lhs
    case rhs
}

//  463. Island Perimeter


class Solution_island {
    
    var visited = Set<String>()
    
    //   周长
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
            j = 0
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
            
            if ii >= 1{
                let up = grid[ii - 1][jj]
                let key = "\(ii - 1)_\(jj)"
                if visited.contains(key) == false, up == 1{
                    visited.insert(key)
                    result += getEgde(grid, ii: ii - 1, jj: jj, orient: .down)
                    
                    // result += 4 - 2
                    // 一个 dot, 四条边
                    // 减去两个 dot 的共有边， 1 + 1
                    
                    //
                    
                    //
                    
                    // 还有一种情况，共有边的转移
                    queue.append((ii - 1, jj))
                }
            }
            if ii < height - 1{
                let down = grid[ii + 1][jj]
                let key = "\(ii + 1)_\(jj)"
                if visited.contains(key) == false, down == 1{
                    visited.insert(key)
                    result += getEgde(grid, ii: ii + 1, jj: jj, orient: .up)
                    queue.append((ii + 1, jj))
                }
            }
            if jj >= 1{
                let lhs = grid[ii][jj - 1]
                let key = "\(ii)_\(jj - 1)"
                if visited.contains(key) == false, lhs == 1{
                    visited.insert(key)
                    result += getEgde(grid, ii: ii, jj: jj - 1, orient: .rhs)
                    queue.append((ii, jj - 1))
                }
            }
            
            if jj < width - 1{
                let rhs = grid[ii][jj + 1]
                let key = "\(ii)_\(jj + 1)"
                if visited.contains(key) == false, rhs == 1{
                    visited.insert(key)
                    result += getEgde(grid, ii: ii, jj: jj + 1, orient: .lhs)
                    queue.append((ii, jj + 1))
                }
            }
            
        }
     //   print(visited)
        
        return result
    }
    
    
    
    
    
    func getEgde(_ grid: [[Int]], ii: Int, jj: Int, orient direction: Direction) -> Int {
        
        
        let height = grid.count
        let width = grid[0].count
        var source: [Direction] = [.up, .down, .lhs, .rhs]
        
        source.removeAll { orient in
            orient == direction
        }
        
        var result = 2
        
        while source.isEmpty == false {
            let pop = source.removeFirst()
            switch pop {
            case .up:
                if ii >= 1{
                    let key = "\(ii - 1)_\(jj)"
                    if visited.contains(key){
                        result -= 2
                    }
                }
            case .down:
                if ii < height - 1{
                    let key = "\(ii + 1)_\(jj)"
                    if visited.contains(key){
                        result -= 2
                    }
                }
            case .lhs:
                if jj >= 1{
                    let key = "\(ii)_\(jj - 1)"
                    if visited.contains(key){
                        result -= 2
                    }
                }
            case .rhs:
                if jj < width - 1{
                    let key = "\(ii)_\(jj + 1)"
                    if visited.contains(key){
                        result -= 2
                    }
                }
            }
            
        }
        return result
    }
    
    
    
}



extension Solution_island{
    
    
    
    func test(){
        
        
        
        
        var hahaha = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]

        hahaha = [[1]]

        hahaha = [[1, 1]]

        hahaha = [[0],[1]]

        hahaha = [[1,1],[1,1]]
         

        let result = Solution_island().islandPerimeter(hahaha)


        print(result)






        //  (       <           733. Flood Fill             >)





        print("\n\n\n")

    }
}







class Solution_island___x {
    
    var visited = Set<String>()
    
    //   周长
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
            j = 0
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
            
            if ii >= 1{
                let up = grid[ii - 1][jj]
                let key = "\(ii - 1)_\(jj)"
                if visited.contains(key) == false, up == 1{
                    visited.insert(key)
                    result += getEgde(grid, ii: ii - 1, jj: jj, orient: .down)
                    
                    // result += 4 - 2
                    // 一个 dot, 四条边
                    // 减去两个 dot 的共有边， 1 + 1
                    
                    //
                    
                    //
                    
                    // 还有一种情况，共有边的转移
                    queue.append((ii - 1, jj))
                }
            }
            if ii < height - 1{
                let down = grid[ii + 1][jj]
                let key = "\(ii + 1)_\(jj)"
                if visited.contains(key) == false, down == 1{
                    visited.insert(key)
                    result += getEgde(grid, ii: ii + 1, jj: jj, orient: .up)
                    queue.append((ii + 1, jj))
                }
            }
            if jj >= 1{
                let lhs = grid[ii][jj - 1]
                let key = "\(ii)_\(jj - 1)"
                if visited.contains(key) == false, lhs == 1{
                    visited.insert(key)
                    result += getEgde(grid, ii: ii, jj: jj - 1, orient: .rhs)
                    queue.append((ii, jj - 1))
                }
            }
            
            if jj < width - 1{
                let rhs = grid[ii][jj + 1]
                let key = "\(ii)_\(jj + 1)"
                if visited.contains(key) == false, rhs == 1{
                    visited.insert(key)
                    result += getEgde(grid, ii: ii, jj: jj + 1, orient: .lhs)
                    queue.append((ii, jj + 1))
                }
            }
            
        }
     //   print(visited)
        
        return result
    }
    
    
    
    
    
    func getEgde(_ grid: [[Int]], ii: Int, jj: Int, orient direction: Direction) -> Int {
        
        
        let height = grid.count
        let width = grid[0].count
        var source: [Direction] = [.up, .down, .lhs, .rhs]
        
        source.removeAll { orient in
            orient == direction
        }
        
        var result = 2
        
        while source.isEmpty == false {
            let pop = source.removeFirst()
            switch pop {
            case .up:
                if ii >= 1{
                    let key = "\(ii - 1)_\(jj)"
                    if visited.contains(key){
                        result -= 2
                    }
                }
            case .down:
                if ii < height - 1{
                    let key = "\(ii + 1)_\(jj)"
                    if visited.contains(key){
                        result -= 2
                    }
                }
            case .lhs:
                if jj >= 1{
                    let key = "\(ii)_\(jj - 1)"
                    if visited.contains(key){
                        result -= 2
                    }
                }
            case .rhs:
                if jj < width - 1{
                    let key = "\(ii)_\(jj + 1)"
                    if visited.contains(key){
                        result -= 2
                    }
                }
            }
            
        }
        return result
    }
    
    
    
}
