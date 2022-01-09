//
//  LengthOfLastWord.swift
//  interview
//
//  Created by Jz D on 2021/10/26.
//

import Foundation



class LengthOfLastWord{

// 58. Length of Last Word

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let cnt = s.count
        guard cnt > 0 else { return 0 }
        var current = cnt - 1
        var willEnd = false
        let start = s.startIndex
        var register = 0
        while current >= 0{
            if s[s.index(start, offsetBy: current)] == " "{
                if willEnd{
                    return register
                }
            }
            else{
                willEnd = true
                register += 1
            }
            current -= 1
        }
        return register
    }
}



    func test(){
        let result = Solution().lengthOfLastWord("Hello World")



        print(result)

    }



}
