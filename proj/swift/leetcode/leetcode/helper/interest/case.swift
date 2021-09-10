//
//  case.swift
//  leetcode
//
//  Created by Jz D on 2021/9/10.
//

import Foundation





func modeVisit(){
    let half = 4

    let cnt = half * 2
    var arr = [[Int]](repeating: [Int](repeating: 0, count: cnt), count: cnt)

    // 访问方式，调整


    var j = 0
    while j < half{
        var hip = half - j - 1
        while hip <= half + j{
            let lhsSolid = half - j - 1
            let rhsSolid = half + j
            arr[hip][lhsSolid] = 1  // hip  lhs  increase
            arr[hip][rhsSolid] = 1  // hip  rhs  increase
            arr[lhsSolid][hip] = 1
            arr[rhsSolid][hip] = 1
            hip += 1
        }
        j += 1
        arr.forEach {  print($0)    }
        print("\n")
    }

}
