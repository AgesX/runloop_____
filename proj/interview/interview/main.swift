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
        guard cnt > numRows else{
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
                i = numRows - 1
                result.append(s[s.index(start, offsetBy: i)])
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
                    i += distance
                    let lhs = i - row
                    let rhs = i + row
                    if lhs < cnt{
                        result.append(s[s.index(start, offsetBy: lhs)])
                    }
                    if rhs < cnt{
                        result.append(s[s.index(start, offsetBy: rhs)])
                    }
                }
            }
            row += 1
        }
        return result
    }
}



