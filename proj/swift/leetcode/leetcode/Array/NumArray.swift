//
//  NumArray.swift
//  leetcode
//
//  Created by Jz D on 2021/8/16.
//

import Foundation






class NumArray{
    
    let container: [Int]
    
    
    

    init(_ nums: [Int]) {
        container = nums
    }
    
    
    
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        
        guard left >= 0, right < container.count else {
            return 0
        }
        var result = 0
        var i = left
        while i <= right {
            result += container[i]
            i += 1
        }
        return result
    }
}




//      303. Range Sum Query - Immutable

