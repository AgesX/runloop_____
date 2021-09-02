//
//  arrayNesting.swift
//  leetcode
//
//  Created by Jz D on 2021/9/2.
//

import Foundation





// 并查集，

// 解决集合的归类问题

// 把相同类型的元素，归类在一起







class Solution_arrayNesting {
    func arrayNesting(_ nums: [Int]) -> Int {
        let cnt = nums.count
        guard cnt > 0 else {
            return 0
        }
        var visitTbd = Array(repeating: true, count: cnt)
        var result = 0
        for ele in nums{
            if visitTbd[ele]{
                var cnt = 0
                var tmp = ele
                repeat{
                    
                    cnt += 1
                    
                    visitTbd[tmp] = false
                    tmp = nums[tmp]
                //    print(cnt, "ele:   ",ele, index, tmp)
                }while(ele != tmp)
                result = max(result, cnt)
            }
        }
        return result
    }
}




extension Solution_arrayNesting{
    func test(){
        
        
        var arr = [5,4,0,3,1,6,2]

        arr = [0,1,2]

        let result = Solution_arrayNesting().arrayNesting(arr)
        print(result)

    }
}










class Solution_arrayNesting_complex {
    
    // 有一个链表的结构
    
    
    func arrayNesting(_ nums: [Int]) -> Int {
        let cnt = nums.count
        guard cnt > 0 else {
            return 0
        }
        var arr = Array(0..<cnt)
        for i in 0..<cnt{
            if arr[i] >= i{
                var tmp = nums[i]
                while i != tmp{
                   // print(i, tmp)
                    if let idx = nums.firstIndex(of: nums[tmp]){
                        arr[idx] = i
                        tmp = nums[idx]
                    }
                }
            }
        }
       // print(arr)
        var cntDict = [Int: Int]()
        for ele in arr{
            let val = cntDict[ele] ?? 0
            cntDict.updateValue(val + 1, forKey: ele)
        }
        
        return cntDict.values.max() ?? 0
    }
    
    
}
    
    



extension Solution_arrayNesting_complex{
    
    
    func test(){
        var arr = [5,4,0,3,1,6,2]

        arr = [0,1,2]

        let result = Solution_arrayNesting_complex().arrayNesting(arr)
        print(result)
    }
    
}

