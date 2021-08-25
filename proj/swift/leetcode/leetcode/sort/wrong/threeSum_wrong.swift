//
//  threeSum_wrong.swift
//  leetcode
//
//  Created by Jz D on 2021/8/25.
//

import Foundation



class Solution_wrong_again {
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








enum CompareResult{
    case less , more , equal
}


extension Int{
    func compareX(other rhs: Int) -> CompareResult{
        if self == rhs{
            return .equal
        }
        else if self < rhs{
            return .less
        }
        else{
            return .more
        }
    }
}


extension Collection where Element == Int{
    var fingerPrint: String{
        reduce("") { final, piece in
            "\(final)_\(piece)"
        }
    }
}


class Solution_threeSum {
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
        var result = [[Int]]()
        var i = 0
        var rmDuplicate = Set<String>()
        while i <= cnt - 3{
            var j = i + 1
            let target = -1 * sorted[i]
            var final = cnt - 1
            while j < final {
                let sum = sorted[j] + sorted[final]
                // print(sorted[j], "     :     ", sorted[final], "     :     ", sum, "     :     ",target)
                let upshot = target.compareX(other: sum)
                switch upshot {
                case .equal:
                    let cake = [sorted[i], sorted[j], sorted[final]]
                    if rmDuplicate.contains(cake.fingerPrint) == false{
                        result.append(cake)
                        rmDuplicate.insert(cake.fingerPrint)
                    }
                    if j + 1 < final{
                        let testSum = sorted[j + 1] + sorted[final]
                        let testUpshot = target - testSum
                        // print(sorted[j + 1], "     :     ", sorted[final], "     :     ", testSum, "     :     ",target, "\n\n")
                        if testUpshot >= 0{
                            j += 1
                        }
                        else{
                            final -= 1
                        }
                    }
                    else{
                        j += 1
                    }
                case .less:
                    // target < sum
                    final -= 1
                case .more:
                    j += 1
                }
            }
            i += 1
        }
        return result
    }
}






extension Solution_threeSum{
    
    
    func test(){
        
        
        var source = [-1,0,1,2,-1,-4]

        source = [3,0,-2,-1,1,2]


        let result = Solution_threeSum().threeSum(source)

        print(result)
        
    }
    
    
}



