//
//  TestOne.swift
//  leetcode
//
//  Created by Jz D on 2021/8/14.
//

import Foundation



class Solution {
    func isPrefixString(_ s: String, _ words: [String]) -> Bool {
        let sLen = s.count
        let wordLen = words.count
        
        var shouldReturn: Bool? = nil
        switch (sLen == 0, wordLen == 0){
        case (true, true):
            shouldReturn = true
        case (true, false):
            shouldReturn = false
        case (false, true):
            shouldReturn = false
        case (false, false):
            shouldReturn = nil
        }
        
        guard shouldReturn == nil else {
            return shouldReturn!
        }
        
        var begin = 0
        var i = 0
        while begin < sLen, i < wordLen {
            let start = s.index(s.startIndex, offsetBy: begin)
            if begin + words[i].count > sLen{
                return false
            }
            let end = s.index(s.startIndex, offsetBy: begin + words[i].count)
            if String(s[start..<end]) == words[i]{
                begin += words[i].count
                i += 1
            }
            else{
                return false
            }
        }
        if begin < sLen{
            i += 1
        }
            
        // just prefix, not all
        return i <= wordLen
    }
    
    
    
    func test(){
        
        var str = "iloveleetcode"
        var words = ["i","love","leetcode","apples"]


        str = "ccccccccc"
        words = ["c","cc"]

        let result = Solution().isPrefixString(str, words)


        print(result)


        // just prefix, not all



        // 1961. Check If String Is a Prefix of Array
        
        
    }
}
