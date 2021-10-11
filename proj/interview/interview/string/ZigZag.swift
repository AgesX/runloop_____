//
//  ZigZag.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation




// 6. ZigZag Conversion

class ZigZag{

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        var result = ""
        var row = 0
        let cnt = s.count
        guard cnt > numRows, numRows > 1 else{
            return s
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
                i = numRows - 1
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
                    let lhs = i - (numRows - 1 - row)
                    let rhs = i + (numRows - 1 - row)
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
            if row > 0, row < (numRows - 1){
                let lhs = i - (numRows - 1 - row)
                let rhs = i + (numRows - 1 - row)
                if lhs < cnt{
                    result.append(s[s.index(start, offsetBy: lhs)])
                }
                if rhs < cnt{
                    result.append(s[s.index(start, offsetBy: rhs)])
                }
            }
            row += 1
        }
        return result
    }
}

    func test(){
        var s = "PAYPALISHIRING", numRows = 3
        // s = "PAYPA"


        // print(result)

        // s = "ABCD"
        // numRows = 3

        let result = Solution().convert(s, numRows)

        print(result)

        print(result == "PAHNAPLSIIGYIR")
    }



}
