//
//  main.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation

// 11. Container With Most Water


class Solution {
    func maxArea(_ height: [Int]) -> Int {
        
        struct Interest{
            let h: Int
            let index: Int
        }
        
        
        var result = 0
        let cnt = height.count
        guard cnt > 1 else { return 0 }
        let first = height[0]
        
        
        // value : index
        var dataSet: [Interest] = [Interest(h: first, index: 0)]
        var i = 1
        
        while i < cnt{
            let h = height[i]
            var j = 0
            let datCnt = dataSet.count
            Inner: while j < datCnt{
                if dataSet[j].h >= h{
                    break Inner
                }
                else{
                    
                    j += 1
                }
            }
            result = max(result, 0)
            i += 1
        }
        
        
        
        
        return result
    }
}
