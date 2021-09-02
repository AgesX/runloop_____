//
//  uniquePathsWithObstacles.swift
//  leetcode
//
//  Created by Jz D on 2021/9/2.
//

import Foundation






class Solution_uniquePathsWithObstacles {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        guard m > 0 else {
            return 0
        }
        let n = obstacleGrid[0].count
        guard n > 0 else {
            return 0
        }
        
        var container = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        
        
        
        // 这是二号型
        // 相比一号型，
        
        // 需要先建立第一行的值，和第一列的值
        
        
        if obstacleGrid[0][0] == 0{
            container[0][0] = 1
        }
        
        
        for k in 1..<n{
            if obstacleGrid[0][k] == 0{
                container[0][k] = container[0][k - 1]
            }
            else{
                container[0][k] = 0
            }
        }
        
        for k in 1..<m{
            if obstacleGrid[k][0] == 0{
                container[k][0] = container[k - 1][0]
            }
            else{
                container[k][0] = 0
            }
        }
        
        
        
        
        var i = 1
        while i < m {
            var j = 1
            while j < n {
                let up = obstacleGrid[i - 1][j]
                let left = obstacleGrid[i][j - 1]
                switch (up, left){
                case (0, 0):
                    container[i][j] = container[i - 1][j] + container[i][j - 1]
                case (0, 1):
                    container[i][j] = container[i - 1][j]
                case (1, 0):
                    container[i][j] = container[i][j - 1]
                case (1, 1):
                    container[i][j] = 0
                default:()
                }
                if obstacleGrid[i][j] == 1{
                    container[i][j] = 0
                }
                j += 1
            }
            i += 1
        }
        return container[m - 1][n - 1]
    }
}




extension Solution_uniquePathsWithObstacles{
    
    
    
    
    func test(){
        var input = [[0,0,0],[0,1,0],[0,0,0]]

        input = [[0,1],[0,0]]
        input = [[1,0],[0,0]]
        input = [[0,0],[1,1],[0,0]]

        input = [[0,0],[0,1]]

        let result = Solution_uniquePathsWithObstacles().uniquePathsWithObstacles(input)


        print(result)

    }
    
    
    
}


