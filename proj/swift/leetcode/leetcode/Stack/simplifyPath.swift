//
//  simplifyPath.swift
//  leetcode
//
//  Created by Jz D on 2021/8/24.
//

import Foundation




class Solution_simplifyPath{
    
    
    
    func simplifyPath(_ path: String) -> String {
        var cnt = path.count
        guard cnt > 0 else {
            return ""
        }
        let slash: Character = "/"
        var i = 0
        let beginIdx = path.startIndex
        var handleOne = ""
        while i < cnt {
            var hasSlash = false
            while i < cnt, path[path.index(beginIdx, offsetBy: i)] == slash{
                hasSlash = true
                i += 1
            }
            if hasSlash{
                handleOne.append(slash)
            }
            if i < cnt{
                handleOne.append(path[path.index(beginIdx, offsetBy: i)])
            }
            i += 1
        }
        if let last = handleOne.last, last == slash{
            handleOne.removeLast()
        }
        var container = handleOne.components(separatedBy: String(slash))
        cnt = container.count
        i = 0
        while i < cnt {
            var pop = 0
            inner: for char in container[i]{
                if char == "."{
                    pop += 1
                }
                else{
                    pop = 0
                    break inner
                }
            }
            if pop < 3{
                while i >= 0, i < cnt, pop > 0{
                    container.remove(at: i)
                    i -= 1
                    pop -= 1
                    cnt = container.count
                }
            }
            i += 1
        }
        let result = container.joined(separator: String(slash))
        if result.isEmpty{
            return String(slash)
        }
        else if let startChar = result.first, startChar != slash{
            return String(slash) + result
        }
        else{
            return result
        }
    }
    
    
    
}





extension Solution_simplifyPath{
    func test(){
        
        
        var test = "/home/"
        test =  "/../"
        test = "/home//foo/"

        let result = Solution_simplifyPath().simplifyPath(test)


        print(result)


       
    }
    
}





//  71. Simplify Path


// java 10 行
