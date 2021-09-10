


import Foundation









class Solution_orderOfLargestPlusSign_time_limit {
    
    // mines , 地雷
    func orderOfLargestPlusSign(_ n: Int, _ mines: [[Int]]) -> Int {
        guard n > 2 else {
            var i = 0
            while i < n {
                var j = 0
                while j < n {
                    if mines.contains([i, j]) == false{
                        return 1
                    }
                    j += 1
                }
                i += 1
            }
            return 0
        }
        let half = n / 2
        let even = (n % 2 == 0)
        var edgeMax = half
        if even{
            edgeMax = half - 1
        }
        var result = 0
    
            var j = 0
            while j < half{
                var hip = half - j - 1
                while hip <= half + j{
                    let lhsSolid = half - j - 1
                    let rhsSolid = half + j
                    let lhsHip = [hip, lhsSolid]
                    let rhsHip = [hip, rhsSolid]
                    let lhsTop = [lhsSolid, hip]
                    let rhsTop = [rhsSolid, hip]
                    print(rhsHip)
                    result = max(check(lhsHip, in: mines, from: edgeMax, within: n), result)
                    result = max(check(rhsHip, in: mines, from: edgeMax, within: n), result)
                    result = max(check(lhsTop, in: mines, from: edgeMax, within: n), result)
                    result = max(check(rhsTop, in: mines, from: edgeMax, within: n), result)
                    
                    hip += 1
                }
                j += 1
                edgeMax -= 1
            }
        
        return result
        
    }
    
    
    
    
    func check(_ pt: [Int], in arr: [[Int]], from edge: Int, within n: Int) -> Int{
        guard arr.contains(pt) == false else {
            return 0
        }
        var i = 0
        var result = 1
        while i < edge {
            let up = pt[0] - 1 - i
            let down = pt[0] + 1 + i
            let lhs = pt[1] - 1 - i
            let rhs = pt[1] + 1 + i
            guard lhs >= 0, up >= 0, down < n, rhs < n else {
                return result
            }
            if arr.contains([up, pt[1]]){
                return result
            }
            
            if arr.contains([down, pt[1]]){
                return result
            }
            
            if arr.contains([pt[0], lhs]){
                return result
            }
            
            if arr.contains([pt[0], rhs]){
                return result
            }
            result += 1
            i += 1
        }
        return result
    }
}





var n = 5, mines = [[4,2]]


n = 2
mines = [[0,0],[0,1],[1,0]]

let result = Solution_orderOfLargestPlusSign_time_limit().orderOfLargestPlusSign(n, mines)

print(result)
















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



let blackList = [[0,1],[0,2],[1,0],[1,2],[1,4],[2,0],[2,2],[3,0],[3,1],[4,0],[4,1],[4,3],[4,4]]

let nn = 5
var info = [[Int]](repeating: [Int](repeating: 1, count: nn), count: nn)

var i = 0

while i < nn{
    var j = 0
    while j < nn{
        if blackList.contains([i, j]){
            info[i][j] = 0
        }
        j += 1
    }
    i += 1
}



info.forEach { print($0) }



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


