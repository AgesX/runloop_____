//
//  slowestKey.swift
//  leetcode
//
//  Created by Jz D on 2021/9/7.
//

import Foundation






class Solution_slowestKey {
    func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {
        let cnt = releaseTimes.count
        var current = keysPressed.startIndex
        let start = keysPressed[current]
        guard cnt > 1 else {
            return start
        }
        
        var i = 1
        var tmp = start
        var last = releaseTimes[0]
        
        
        
        while i < cnt {
            current = keysPressed.index(current, offsetBy: 1)
            let val = releaseTimes[i] - releaseTimes[i - 1]
          //  print(last,  "   " , val)
            let figureI = keysPressed[current]
            if val > last{
                tmp = figureI
                last = val
            }
            else if val == last, tmp.ascII_scalar < figureI.ascII_scalar{
                tmp = figureI
            }
            
            i += 1
        }
        return tmp
    }
}



//  1629. Slowest Key







extension Solution_slowestKey{
    
    func test(){
        var release = [12,23,36,46,62]
        var key = "spuda"



        release = [23,34,43,59,62,80,83,92,97]
        key = "qgkzzihfc"

        let result = Solution_slowestKey().slowestKey(release, key)

        print(result)
    }
    
}







extension Character{
    
    var ascII_val: Int{
        if let val = unicodeScalars.first?.value{
            return Int(val)
        }
        else{
            return -1
        }
    }
    
    
    
    var ascII_scalar: Int{
        if let val = asciiValue{
            return Int(val)
        }
        else{
            return -1
        }
    }
    
}



