
import Foundation




class Solution_C {
    
    
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        let cnt = nums.count
        guard cnt > 0 else {
            return nil
        }
        let mid = cnt/2
        let result = TreeNode(nums[mid])
        if mid > 0{
            result.left = sortedArrayToBST(Array(nums[0..<mid]))
        }
        if mid < cnt - 1{
            result.right = sortedArrayToBST(Array(nums[(mid + 1)..<cnt]))
        }
        
        return result
    }
    
    
    
    
    
}




extension Solution_C {


    func test(){
        let arr = [-10,-3,0,5,9]

        var result = Solution_C().sortedArrayToBST(arr)


        print(result ?? "    __ ")
    }



}



//  108. Convert Sorted Array to Binary Search Tree

