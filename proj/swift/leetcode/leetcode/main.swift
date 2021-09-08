


import Foundation




//   848. Shifting Letters

class Solution{
    func shiftingLetters(_ s: String, _ shifts: [Int]) -> String {
        let n = shifts.count
        guard n > 0 else {
            return s
        }
        let start: Character = "a"
        let end: Character = "z"
        guard let begin = start.asciiValue, let final = end.asciiValue else {
            return s
        }
        let lhs = Int(begin) - 1
        let rhs = Int(final)
        var newInfo: [Int] = shifts.reversed().reduce([]){ result, ele in
            var tmp = result
            let validVal = ele % 26
            if let last = result.last{
                tmp.append(last + validVal)
            }
            else{
                tmp.append(validVal)
            }
            return tmp
        }
        newInfo = newInfo.map({ ele in
            ele % 26
        }).reversed()
        var arr = Array(s)
        var j = n - 1
        while j >= 0 {
            let backward = newInfo[j]
           
                if let val = arr[j].asciiValue{
                    var newVal = Int(val) + backward
                    if newVal > rhs{
                        newVal = lhs + (newVal - rhs)
                    }
                    if let scalar = Unicode.Scalar(UInt32(newVal)){
                        arr[j] = Character(scalar)
                    }
                }
               
            j -= 1
        }
        return arr.reduce("") { result, char in
            var tmp = result
            tmp.append(char)
            return tmp
        }
    }
}




// 应该把数据，都整理好了

// 再进行执行


class Solution_Time_Limit {
    func shiftingLetters(_ s: String, _ shifts: [Int]) -> String {
        let n = shifts.count
        guard n > 0 else {
            return s
        }
        let start: Character = "a"
        let end: Character = "z"
        guard let begin = start.asciiValue, let final = end.asciiValue else {
            return s
        }
        let lhs = Int(begin) - 1
        let rhs = Int(final)
        let newInfo = shifts.map { val in
            val % 26
        }
        var arr = Array(s)
        var j = n - 1
        while j >= 0 {
            let backward = newInfo[j]
            var i = 0
            while i <= j {
                if let val = arr[i].asciiValue{
                    var newVal = Int(val) + backward
                    if newVal > rhs{
                        newVal = lhs + (newVal - rhs)
                    }
                    if let scalar = Unicode.Scalar(UInt32(newVal)){
                        arr[i] = Character(scalar)
                    }
                }
                i += 1
            }
            j -= 1
        }
        return arr.reduce("") { result, char in
            var tmp = result
            tmp.append(char)
            return tmp
        }
    }
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


Web().test()
