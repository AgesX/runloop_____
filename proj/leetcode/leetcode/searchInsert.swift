//
//  searchInsert.swift
//  leetcode
//
//  Created by Jz D on 2021/8/14.
//

import Foundation




class Solution_one {
    
    
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let cnt = nums.count
        guard cnt > 0 else {
            return 0
        }
        
        var lhs = 0
        var rhs = cnt   //  3
        
        while lhs < rhs {
            
            let mid = (lhs + rhs) / 2   //  1   //  0
            // 2
            let val = nums[mid]         // 3    //  1
            // 7
            if val == target{
                return mid
            }
            else if val > target{
                rhs = mid
                // 2
            }
            else{
                // <
                lhs = mid + 1     // 1
                // 这个要记住
                
            }
            
            
        }
        
        return (lhs + rhs) / 2
    }
    
    
    
    
    
    
    
    
}


extension Solution_one{
    
    
    func test(){
        var nums = [1, 3, 7]

        var tar = 3

        // tar = 0


        // tar = 5

        let tmp = Solution_one().searchInsert(nums, tar)



        print(tmp)

    }
    
    
    
}

