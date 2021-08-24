//
//  maxFreq.swift
//  leetcode
//
//  Created by Jz D on 2021/8/24.
//

import Foundation






class Solution_maxFreq {
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        
        var substrsCounter = [String:Int]()
        // 伸缩
        var subStr = ""
        var charsCounter = [Character:Int]()
        for ch in s {
            subStr.append(ch)
            charsCounter.updateValue(1 + (charsCounter[ch] ?? 0), forKey: ch)
            
            if subStr.count == minSize {
                if charsCounter.count <= maxLetters {
                    substrsCounter.updateValue(1 + (substrsCounter[subStr]  ?? 0), forKey: subStr)
                }
                let ch = subStr.removeFirst()
                if let c = charsCounter[ch] {
                    if c == 1 {
                        charsCounter.removeValue(forKey: ch)
                    } else {
                        charsCounter.updateValue(c - 1, forKey: ch)
                    }
                }
            }
        }
        return substrsCounter.values.max() ?? 0
    }
 }

