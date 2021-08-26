//
//  threeSum.swift
//  leetcode
//
//  Created by Jz D on 2021/8/26.
//

import Foundation






// 只需要，在我最基础的思路上，作一个合并的优化



class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let cnt = nums.count
        var result = [[Int]]()
        let data = nums.sorted(by: <)
        var i = 0
        while i < cnt - 2 {
            if i == 0 || (i > 0 && data[i] != data[i - 1]){
                var low = i + 1, high = cnt - 1, sum = -1 * data[i]
                while low < high {
                    let upshot = data[low] + data[high] - sum
                    if upshot == 0{
                        result.append([data[i], data[low], data[high]])
                        while low < high, data[low] == data[low + 1] {
                            low += 1
                        }
                        while low < high, data[high] == data[high - 1] {
                            high -= 1
                        }
                        low += 1
                        high -= 1
                    }
                    else if upshot < 0{
                        low += 1
                    }
                    else{
                        high -= 1
                    }
                }
            }
            i += 1
        }
        return result
    }
}



