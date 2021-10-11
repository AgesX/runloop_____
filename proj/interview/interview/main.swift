//
//  main.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation



class Solution {
    func reverseParentheses(_ s: String) -> String {
        let cnt = s.count
        guard cnt > 0 else{ return s }
        var result = s
        var bracketIndex = [Int]()
        var i = 0
        let begin = result.startIndex
        while i < result.count{
            switch result[at: i]{
            case "(":
                bracketIndex.append(i)
                i += 1
            case ")":
                // print(result, i)
                if let start = bracketIndex.last{
                    bracketIndex.removeLast()
                    result[at: i] = ""
                    result[at: start] = ""
                    if i - start > 0{
                        let from = result.index(begin, offsetBy: start)
                        let to = result.index(begin, offsetBy: i - 2)
                        let tmp = String(result[from...to])
                        result.replaceSubrange(from...to, with: String(tmp.reversed()))
                    }
                    i -= 1
                }
                // print(result, bracketIndex)
                // print("\n\n\n")
            default:
                i += 1
            }
        }
        return result
    }
}



var testTwo = "(abcd)"
testTwo = "(u(love)i)"
testTwo = "(ed(et(oc))el)"

var result = Solution().reverseParentheses(testTwo)


// print(result)
