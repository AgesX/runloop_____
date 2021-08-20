//
//  maxFreq_wrong.swift
//  leetcode
//
//  Created by Jz D on 2021/8/20.
//

import Foundation





class Solution_maxFreq{
    
    
    
    
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        let cnt = s.count
        guard cnt >= minSize, minSize <= maxSize else {
            return 0
        }
        var len = minSize
        var result = 0
        while len <= maxSize {
            
            var i = 0
            
            while i <= cnt - len {
                var j = i + 1
                var tmpCnt = 1
                let from = s[i..<i+len]
                if from.maxLetters <= maxLetters{
                    result = max(result, 1)
                    while j <= cnt - len {
                        let to = s[j..<j+len]
                     //   print("from:  ", from)
                       // print("to:  ", to)
                        if from == to{
                            tmpCnt += 1
                            result = max(result, tmpCnt)
                        }
                        j += 1
                    }
                }
                i += 1
            }
            
            len += 1
        }
        
        return result
        
        
    }
    
    
    
    
}




extension Solution_maxFreq{
    
    
    func test(){
        
        
        
        let s = "aababcaab", maxLetters = 2, minSize = 3, maxSize = 4


        let result = Solution_maxFreq().maxFreq(s, maxLetters, minSize, maxSize)


        print("result: \n\n\n", result)


        
        
    }
    
    
}





// c - trip ,   face


