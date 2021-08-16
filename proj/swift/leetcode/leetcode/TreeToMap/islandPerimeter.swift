//
//  islandPerimeter.swift
//  leetcode
//
//  Created by Jz D on 2021/8/16.
//

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




    }
}



struct Pt{
    let i: Int
    let j: Int
}


extension Pt{
    var key: String{
        "\(i)_\(j)"
    }
    
    
    var lhs: Pt{
        Pt(i: i, j: j - 1)
    }
    
    var rhs: Pt{
        Pt(i: i, j: j + 1)
    }
    
    var up: Pt{
        Pt(i: i - 1, j: j)
    }
    
    var down: Pt{
        Pt(i: i + 1, j: j)
    }
}



class Solution_island_opt{
    
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
            let pt = Pt(i: pop.0, j: pop.1)
            if pt.i >= 1{
                let newPt = pt.up
                let up = grid[newPt.i][newPt.j]
                let k = newPt.key
                if visited.contains(k) == false, up == 1{
                    visited.insert(k)
                    result += getEgde(grid, pt: newPt, orient: .down)
                    
                    // result += 4 - 2
                    // 一个 dot, 四条边
                    // 减去两个 dot 的共有边， 1 + 1
                    
                    //
                    
                    //
                    
                    // 还有一种情况，共有边的转移
                    queue.append((newPt.i, newPt.j))
                }
            }
            
            
            // 这里面，主要是，获取格子
            if pt.i < height - 1{
                let newPt = pt.down
                let down = grid[newPt.i][newPt.j]
                let k = newPt.key
                if visited.contains(k) == false, down == 1{
                    visited.insert(k)
                    // 下面的方法中，获取格子的有效边
                    result += getEgde(grid, pt: newPt, orient: .up)
                    queue.append((newPt.i, newPt.j))
                }
            }
            if pt.j >= 1{
                let newPt = pt.lhs
                let lhs = grid[newPt.i][newPt.j]
                let key = newPt.key
                if visited.contains(key) == false, lhs == 1{
                    visited.insert(key)
                    result += getEgde(grid, pt: newPt, orient: .rhs)
                    queue.append((newPt.i, newPt.j))
                }
            }
            
            if pt.j < width - 1{
                let newPt = pt.rhs
                let rhs = grid[newPt.i][newPt.j]
                let key = newPt.key
                if visited.contains(key) == false, rhs == 1{
                    visited.insert(key)
                    result += getEgde(grid, pt: newPt, orient: .lhs)
                    queue.append((newPt.i, newPt.j))
                }
            }
            
        }
     //   print(visited)
        
        return result
    }
    
    
    
    
    
    func getEgde(_ grid: [[Int]], pt: Pt, orient direction: Direction) -> Int {
        
        
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
                if pt.i >= 1{
                    let key = pt.up.key
                    if visited.contains(key){
                        result -= 2
                    }
                }
            case .down:
                if pt.i < height - 1{
                    let key = pt.down.key
                    if visited.contains(key){
                        result -= 2
                    }
                }
            case .lhs:
                if pt.j >= 1{
                    let key = pt.lhs.key
                    if visited.contains(key){
                        result -= 2
                    }
                }
            case .rhs:
                if pt.j < width - 1{
                    let key = pt.rhs.key
                    if visited.contains(key){
                        result -= 2
                    }
                }
            }
            
        }
        return result
    }
    
    
    
}




