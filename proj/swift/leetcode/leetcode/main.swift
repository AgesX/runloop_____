


import Foundation


class Solution {
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
        while true {
            let rhsIdx = (lhsCnt + rhsCnt)/2 - lhsIdx
            let lhsIfOne = nums1[lhsIdx] > nums2[rhsIdx - 1]
            let rhsIfOne = nums1[lhsIdx] < nums2[rhsIdx + 1]
            switch (lhsIfOne, rhsIfOne) {
            case (true, true):
                return (nums1.mid + nums2.mid)/2
            case (true, false):
                if lhsIdx <= 0{
                    
                }
                lhsIdx -= 1
            case (false, true):
                if lhsIdx >= lhsCnt - 1{
                    
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


