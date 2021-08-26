//
//  triSUm.swift
//  leetcode
//
//  Created by Jz D on 2021/8/26.
//

import Foundation







func insect(lhs left: [[Int]], rhs right: [[Int]]){
    
    let one = left.map { arr in
        arr.fingerPrint
    }
    
    let two = right.map { arr in
        arr.fingerPrint
    }
    
    var lhsArr = left
    var rhsArr = right
    
    let oneCnt = one.count
    
    var i = 0
    
    while i < oneCnt {
        if two.contains(one[i]){
            lhsArr.rm(first: left[i])
            rhsArr.rm(first: left[i])
        }
        i += 1
    }
    
    print(lhsArr)
    print(rhsArr)
}





extension Array where Element == Int{
    
    func ascend(rhs right: [Int]) -> Bool{
        let cnt = count
        var i = 0
        while i < cnt {
            if self[i] < right[i]{
                return true
            }
            else if self[i] > right[i]{
                return false
            }
            i += 1
        }
        return true
    }
    
}



extension Array where Element == [Int]{
    
    
    
    
    
    mutating
    func rm(first one: [Int]){
        let cnt = count
        var i = 0
        while i < cnt {
            if self[i] == one{
                remove(at: i)
                break
            }
            i += 1
        }
    }
    
}




func triSumTest(){
    
    
    
    let lhsX = [[0,-1,1],[0,-3,3],[0,-2,2],[0,-4,4],[-3,-1,4],[-3,-1,4],[-2,-1,3],[-2,-1,3],[-1,-1,2]].map { arr in
        arr.sorted(by: <)
    }

    let rhsX = [[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]]


    insect(lhs: lhsX, rhs: rhsX)

}
