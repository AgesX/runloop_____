//
//  main.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation

// 11. Container With Most Water


// 双指针，大法好

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
                    result = max(result, h * (i - dataSet[j].index))
                    break Inner
                }
                else{
                    result = max(result, dataSet[j].h * (i - dataSet[j].index))
                    if j == datCnt - 1{
                        dataSet.append(Interest(h: h, index: i))
                    }
                    j += 1
                }
            }
            i += 1
        }
        return result
    }
}




var h = [1,1]
h = [4,3,2,1,4]

let result = Solution().maxArea(h)


print(result)
