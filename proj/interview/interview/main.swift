//
//  main.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation



class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        var result = ""
        var row = 0
        let cnt = s.count
        guard cnt > numRows, numRows > 1 else{
            return result
        }
        let start = s.startIndex
        let distance = numRows * 2 - 2
        while row < numRows{
            var i = 0
            switch row{
            case 0:
                i = row
            case (numRows - 1):
                i = row
            default:
                result.append(s[s.index(start, offsetBy: row)])
                i = distance
            }
            while i < cnt{
                switch row{
                case 0:
                    result.append(s[s.index(start, offsetBy: i)])
                    i += distance
                case (numRows - 1):
                    result.append(s[s.index(start, offsetBy: i)])
                    i += distance
                default:
                    // print("hah", i)
                    let lhs = i - row
                    let rhs = i + row
                    if lhs < cnt{
                        result.append(s[s.index(start, offsetBy: lhs)])
                    }
                    if rhs < cnt{
                        result.append(s[s.index(start, offsetBy: rhs)])
                    }
                    i += distance
                }
                // print(result)
            }
            row += 1
        }
        return result
    }
}


var s = "PAYPALISHIRING", numRows = 3
// s = "PAYPA"
let result = Solution().convert(s, numRows)

// print(result)
print(result == "PAHNAPLSIIGYIR")
