//
//  InfoTest.swift
//  leetcode
//
//  Created by Jz D on 2021/9/10.
//

import Foundation





extension Array where Element == [Int]{
    subscript(at index: [Int]) -> Element.Element{
        get{
            self[index[0]][index[1]]
        }
        set{
            self[index[0]][index[1]] = newValue
        }
    }
    
    
    
    
    public var info: String{
        reduce("") { result, ele in
            result + (ele.map{String($0)}).joined(separator: "  ") + "\n"
        }
    }
    
}





func case_test_odd(){
 
    var half = 1
    let n = half * 2 + 1
    var info = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)


    var j = 0
    while j < half{
        var hip = half - j - 1
        while hip <= half + j + 1{
            let lhsSolid = half - j - 1
            let rhsSolid = half + j + 1
            let lhsHip = [hip, lhsSolid]
            let rhsHip = [hip, rhsSolid]
            let lhsTop = [lhsSolid, hip]
            let rhsTop = [rhsSolid, hip]
            info[at: lhsHip] += 1
            info[at: rhsHip] += 1
            info[at: lhsTop] += 1
            info[at: rhsTop] += 1
            hip += 1
        }
        
        j += 1
        print(info.info)
    }

}




func case_test_even(){
 
    var half = 3
    let n = half * 2
    var info = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)


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
            info[at: lhsHip] += 1
            info[at: rhsHip] += 1
            info[at: lhsTop] += 1
            info[at: rhsTop] += 1
            hip += 1
        }
        
        j += 1
        print(info.info)
    }

}



func case_test(){
    
    
    let blackList = [[0,1],[0,2],[1,0],[1,2],[1,4],[2,0],[2,2],[3,0],[3,1],[4,0],[4,1],[4,3],[4,4]]

    let nn = 5
    var info = [[Int]](repeating: [Int](repeating: 1, count: nn), count: nn)

    var i = 0

    while i < nn{
        var j = 0
        while j < nn{
            if blackList.contains([i, j]){
                info[i][j] = 0
            }
            j += 1
        }
        i += 1
    }



    info.forEach { print($0) }
}
