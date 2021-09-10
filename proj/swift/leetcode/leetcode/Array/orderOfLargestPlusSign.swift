//
//  orderOfLargestPlusSign.swift
//  leetcode
//
//  Created by Jz D on 2021/9/10.
//

import Foundation









class Solution_orderOfLargestPlusSign_time_limit {
    
    // mines , 地雷
    func orderOfLargestPlusSign(_ n: Int, _ mines: [[Int]]) -> Int {
        guard n > 2 else {
            var i = 0
            while i < n {
                var j = 0
                while j < n {
                    if mines.contains([i, j]) == false{
                        return 1
                    }
                    j += 1
                }
                i += 1
            }
            return 0
        }
        let half = n / 2
        let even = (n % 2 == 0)
        var edgeMax = half
        if even{
            edgeMax = half - 1
        }
        var result = 0
    
            var j = 0
            while j < half{
                var hip = half - j - 1
                while hip <= half + j{
                    let lhsSolid = half - j - 1
                    let rhsSolid = half + j
                    let lhsHip = [hip, lhsSolid]
                    let rhsHip = [hip, rhsSolid]
                    let lhsTop = [lhsSolid, hip]
                    let rhsTop = [rhsSolid, hip]
                    print(rhsHip)
                    result = max(check(lhsHip, in: mines, from: edgeMax, within: n), result)
                    result = max(check(rhsHip, in: mines, from: edgeMax, within: n), result)
                    result = max(check(lhsTop, in: mines, from: edgeMax, within: n), result)
                    result = max(check(rhsTop, in: mines, from: edgeMax, within: n), result)
                    
                    hip += 1
                }
                j += 1
                edgeMax -= 1
            }
        
        return result
        
    }
    
    
    
    
    func check(_ pt: [Int], in arr: [[Int]], from edge: Int, within n: Int) -> Int{
        guard arr.contains(pt) == false else {
            return 0
        }
        var i = 0
        var result = 1
        while i < edge {
            let up = pt[0] - 1 - i
            let down = pt[0] + 1 + i
            let lhs = pt[1] - 1 - i
            let rhs = pt[1] + 1 + i
            guard lhs >= 0, up >= 0, down < n, rhs < n else {
                return result
            }
            if arr.contains([up, pt[1]]){
                return result
            }
            
            if arr.contains([down, pt[1]]){
                return result
            }
            
            if arr.contains([pt[0], lhs]){
                return result
            }
            
            if arr.contains([pt[0], rhs]){
                return result
            }
            result += 1
            i += 1
        }
        return result
    }
}




extension Solution_orderOfLargestPlusSign_time_limit{
    func test(){
        var n = 5, mines = [[4,2]]


        n = 2
        mines = [[0,0],[0,1],[1,0]]

        let result = Solution_orderOfLargestPlusSign_time_limit().orderOfLargestPlusSign(n, mines)

        print(result)
    }
}





