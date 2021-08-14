
import Foundation





class Solution {
    
    
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let cnt = nums.count
        guard cnt > 0 else {
            return 0
        }
        
        var lhs = 0
        var rhs = cnt   //  3
        
        while lhs < rhs {
            
            let mid = (lhs + rhs) / 2   //  1   //  0
            let val = nums[mid]         // 3    //  1
            if val == target{
                return mid
            }
            else if val > target{
                rhs = mid
            }
            else{
                // <
                lhs = mid       // 1
            }
            
        }
        
        return (lhs + rhs) / 2
    }
    
    
    
    
}



var nums = [1, 3, 7]

var tar = 3

// tar = 0

let tmp = Solution().searchInsert(nums, tar)



print(tmp)
