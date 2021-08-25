



import Foundation



// 查表大法好


// 分表大法更好

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        let cnt = nums.count
        guard cnt >= 3 else {
            return []
        }
        let sorted = nums.sorted(by: <)
        // print(sorted)
        guard sorted[0] <= 0, let final = sorted.last, final >= 0 else {
            return []
        }
        var dictLess = [Int: Int]()
        var arrLess = [Int]()
        
        var dictMore = [Int: Int]()
        var arrMore = [Int]()
        
        var dictZero = [Int: Int]()
        
        for cake in sorted{
            let upshot = cake.compareX(other: 0)
            switch upshot {
            case .equal:
                let val = (dictZero[cake] ?? 0) + 1
                if val <= 3{
                    dictZero.updateValue(val, forKey: cake)
                }
            case .less:
                let val = (dictLess[cake] ?? 0) + 1
                if val <= 3{
                    dictLess.updateValue(val, forKey: cake)
                    arrLess.append(cake)
                }
            case .more:
                let val = (dictMore[cake] ?? 0) + 1
                if val <= 3{
                    dictMore.updateValue(val, forKey: cake)
                    arrMore.append(cake)
                }
            }
        }
        
        var result = [[Int]]()
      //  let zeroCnt = dictZero.count
      //  print(zeroCnt, dictZero)
        if let zeroCnt = dictZero[0]{
            if zeroCnt >= 3{
                result.append([0, 0, 0])
            }
            else if zeroCnt >= 1{
                let lessK = dictLess.keys
                for k in lessK{
                    let left = k * (-1)
                    if dictMore.keys.contains(left){
                        result.append([0, k, left])
                    }
                }
            }
        }
        let moreCnt = arrMore.count
        let lessCnt = arrLess.count
       // print(arrLess)
       // print(arrMore)
      //  print(dictMore)
        
        var i = 0
        while i < lessCnt {
            var j = i + 1
            while j < lessCnt {
                let val = arrLess[i] + arrLess[j]
                let left = val * (-1)
                if arrMore.contains(left){
                    result.append([arrLess[i], arrLess[j], left])
                }
                j += 1
            }
            i += 1
        }
        for oreo in arrLess{
            let left = oreo * (-1)
            var p = 0
            while p < moreCnt {
                let upshot = left - arrMore[p]
                if let val = dictMore[upshot]{
                    if upshot == upshot{
                        if val > 1{
                            result.append([oreo, arrMore[p], upshot])
                            dictMore[upshot] = val - 1
                        }
                    }
                    else{
                        result.append([oreo, arrMore[p], upshot])
                    }
                }
                p += 1
            }
        }
        return result.sorted { lhs, rhs in
            let left = lhs.sorted(by: <).reduce(0) { result, cake in
                result + cake
            }
            let right = rhs.sorted(by: <).reduce(0) { result, cake in
                result + cake
            }
            return left < right
        }
    }
}


/*

var arr = [-1,0,1,2,-1,-4]

arr = [0,0,0]

arr = [1,1,-2]

let result = Solution().threeSum(arr)


print(result)




print("\n\n\n")
*/







func insect(lhs left: [[Int]], rhs right: [[Int]]){
    
    let one = left.map { arr in
        arr.fingerPrint
    }
    
    let two = right.map { arr in
        arr.fingerPrint
    }
    
    var lhsArr = left
    var rhsArr = right
    
    let oneCnt = one.count
    
    var i = 0
    
    while i < oneCnt {
        if two.contains(one[i]){
            lhsArr.rm(first: left[i])
            rhsArr.rm(first: left[i])
        }
        i += 1
    }
    
    print(lhsArr)
    print(rhsArr)
}





extension Array where Element == [Int]{
    
    
    mutating
    func rm(first one: [Int]){
        let cnt = count
        var i = 0
        while i < cnt {
            if self[i] == one{
                remove(at: i)
                break
            }
            i += 1
        }
    }
    
}


let lhsX = [[0,-1,1],[0,-3,3],[0,-2,2],[0,-4,4],[-3,-1,4],[-3,-1,4],[-2,-1,3],[-2,-1,3],[-1,-1,2]].map { arr in
    arr.sorted(by: <)
}

let rhsX = [[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]]


insect(lhs: lhsX, rhs: rhsX)
