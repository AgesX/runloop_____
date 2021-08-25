//
//  threeSum_wrong.swift
//  leetcode
//
//  Created by Jz D on 2021/8/25.
//

import Foundation



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



