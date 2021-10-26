//
//  main.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation






class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let cnt = s.count
        guard cnt > 0 else { return 0 }
        var current = cnt
        var spacing = 0
        let start = s.startIndex
        while current >= 0{
            if s[s.index(start, offsetBy: current)] == " "{
                switch spacing{
                case 0:
                    spacing = 1
                case 1: ()
                case 2: spacing = 3
                default: ()
                }
            }
            else{
                switch spacing{
                case 0:
                    spacing = 1
                case 1: ()
                case 2: spacing = 3
                default: ()
                }
            }
            current -= 1
        }
        
        
        return 0
    }
}



