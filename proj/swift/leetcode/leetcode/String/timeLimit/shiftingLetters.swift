//
//  shiftingLetters.swift
//  leetcode
//
//  Created by Jz D on 2021/9/9.
//

import Foundation







//   848. Shifting Letters

class Solution_shiftingLetters{
    func shiftingLetters(_ s: String, _ shifts: [Int]) -> String {
        let n = shifts.count
        guard n > 0 else {
            return s
        }
        let start: Character = "a"
        let end: Character = "z"
        guard let begin = start.asciiValue, let final = end.asciiValue else {
            return s
        }
        let lhs = Int(begin) - 1
        let rhs = Int(final)
        var newInfo: [Int] = shifts.reversed().reduce([]){ result, ele in
            var tmp = result
            let validVal = ele % 26
            if let last = result.last{
                tmp.append(last + validVal)
            }
            else{
                tmp.append(validVal)
            }
            return tmp
        }
        newInfo = newInfo.map({ ele in
            ele % 26
        }).reversed()
        var arr = Array(s)
        var j = n - 1
        while j >= 0 {
            let backward = newInfo[j]
           
                if let val = arr[j].asciiValue{
                    var newVal = Int(val) + backward
                    if newVal > rhs{
                        newVal = lhs + (newVal - rhs)
                    }
                    if let scalar = Unicode.Scalar(UInt32(newVal)){
                        arr[j] = Character(scalar)
                    }
                }
               
            j -= 1
        }
        return arr.reduce("") { result, char in
            var tmp = result
            tmp.append(char)
            return tmp
        }
    }
}




// 应该把数据，都整理好了

// 再进行执行


class Solution_Time_Limit_shiftingLetters {
    func shiftingLetters(_ s: String, _ shifts: [Int]) -> String {
        let n = shifts.count
        guard n > 0 else {
            return s
        }
        let start: Character = "a"
        let end: Character = "z"
        guard let begin = start.asciiValue, let final = end.asciiValue else {
            return s
        }
        let lhs = Int(begin) - 1
        let rhs = Int(final)
        let newInfo = shifts.map { val in
            val % 26
        }
        var arr = Array(s)
        var j = n - 1
        while j >= 0 {
            let backward = newInfo[j]
            var i = 0
            while i <= j {
                if let val = arr[i].asciiValue{
                    var newVal = Int(val) + backward
                    if newVal > rhs{
                        newVal = lhs + (newVal - rhs)
                    }
                    if let scalar = Unicode.Scalar(UInt32(newVal)){
                        arr[i] = Character(scalar)
                    }
                }
                i += 1
            }
            j -= 1
        }
        return arr.reduce("") { result, char in
            var tmp = result
            tmp.append(char)
            return tmp
        }
    }
}



