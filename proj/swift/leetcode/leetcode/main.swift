


import Foundation









class Solution {
    func orderOfLargestPlusSign(_ n: Int, _ mines: [[Int]]) -> Int {
        let cnt = mines.count
        guard cnt > 2 else {
            return 0
        }
        let half = cnt / 2
        let even = (cnt % 2 == 0)
        var edgeMax = half
        if even{
            edgeMax = half - 1
        }
        if even{
            var i = 0
            while i < half {
                var j = 0
                while j < half {
                    var k = 0
                    while k < half {
                        
                        k += 1
                    }
                    j += 1
                }
                i += 1
            }
            
        }
        else{
            
            
        }
        
        
        
        
        
        
        return 1
        
    }
}


let half = 2

let cnt = half * 2
var arr = [[Int]](repeating: [Int](repeating: 0, count: cnt), count: cnt)

// 访问方式，调整

var i = 0
while i < half {
    var j = 0
    while j < half{
        var k = 0
        while k < half{
            let lhsTop = half - k - 1 //+ j
            let rhsHip = half + k// + j
            arr[lhsTop][lhsTop] = 1
            arr[lhsTop][rhsHip] = 1
            arr[rhsHip][lhsTop] = 1
            arr[rhsHip][rhsHip] = 1
            k += 1
        }
        j += 1
    }
    arr.forEach {  print($0)    }
    print("\n")
    i += 1
}


















class Solution_findMedianSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let lhsCnt = nums1.count
        let rhsCnt = nums2.count
        let lhsOver = lhsCnt > 0
        let rhsOver = rhsCnt > 0
        guard lhsOver || rhsOver else {
            return 0
        }
        guard lhsOver else {
            return nums2.mid
        }
        guard rhsOver else {
            return nums1.mid
        }
        var lhsIdx = lhsCnt / 2
        let isOdd = ((lhsCnt + rhsCnt) % 2 == 1)
        while true {
            let rhsIdx = (lhsCnt + rhsCnt)/2 - lhsIdx
            
            var lhsIfOne = true
            let rhsIdxBack = rhsIdx - 1
            if rhsIdxBack >= 0{
                lhsIfOne = nums1[lhsIdx] >= nums2[rhsIdxBack]
            }
            
            var rhsIfOne = true
            let rhsIdxForward = rhsIdx + 1
            if rhsIdxForward < rhsCnt{
                rhsIfOne = nums1[lhsIdx] <= nums2[rhsIdxForward]
            }
            switch (lhsIfOne, rhsIfOne){
            case (true, true):
                if isOdd{
                    return Double(min(nums1[lhsIdx], nums2[rhsIdx]))
                }
                else{
                    return Double(nums1[lhsIdx] + nums2[rhsIdx])/2
                }
            case (true, false):
                if lhsIdx <= 0{
                    let newArr = nums2 + nums1
                    return newArr.mid
                }
                lhsIdx -= 1
            case (false, true):
                if lhsIdx >= lhsCnt - 1{
                    let newArr = nums1 + nums2
                    return newArr.mid
                }
                lhsIdx += 1
            case (false, false):
                fatalError()
            }
            
        }
        fatalError()
    }
}











extension Array where Element == Int{
    var mid: Double{
        let mid = count / 2
        if count % 2 == 0{
            return Double(self[mid] + self[mid-1])/2
        }
        else{
            return Double(self[mid])
        }
    }
}




print("\n\n\n")











extension Solution_findMedianSortedArrays{
    
    
    func test(){
        
        
        var nums1 = [1,3], nums2 = [2]

        do{
            nums1 = [1,2]
            nums2 = [3,4]
        }


        do{
            nums1 = [0,0]
            nums2 = [0,0]
            
        }

        do{
            nums1 = [0,0,0,0,0]
            nums2 = [-1,0,0,0,0,0,1]
        }




        do{
            nums1 = [1,3]
            nums2 = [2,7]
        }








        let result = Solution_findMedianSortedArrays().findMedianSortedArrays(nums1, nums2)


        print(result)

        
        
    }
    
}


