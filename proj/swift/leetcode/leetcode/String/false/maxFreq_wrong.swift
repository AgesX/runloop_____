//
//  maxFreq_wrong.swift
//  leetcode
//
//  Created by Jz D on 2021/8/20.
//

import Foundation



class Solution_try_three {
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        let cnt = s.count
        guard cnt >= minSize, minSize <= maxSize else {
            return 0
        }
        var result = 0
        var occurenceDict = [Substring: Int]()
        var i = 0
        while i <= cnt - minSize {
            let start = s.index(s.startIndex, offsetBy: i)
            let end = s.index(s.startIndex, offsetBy: i+minSize)
            let tmp = s[start..<end]
            if tmp.maxLetters <= maxLetters{
                if let val = occurenceDict[tmp]{
                    occurenceDict[tmp] = val + 1
                    result = max(val + 1, result)
                }
                else{
                    occurenceDict[tmp] = 1
                    result = max(1, result)
                }
            }
            i += 1
        }
        return result
    }
}



class Solution_try_two {
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        let cnt = s.count
        guard cnt >= minSize, minSize <= maxSize else {
            return 0
        }
        var result = 0
        var occurenceDict = [String: Int]()
        var i = 0
        while i <= cnt - minSize {
            let tmp = s[i..<i+minSize]
            if tmp.maxLetters <= maxLetters{
                if let val = occurenceDict[tmp]{
                    occurenceDict[tmp] = val + 1
                    result = max(val + 1, result)
                }
                else{
                    occurenceDict[tmp] = 1
                    result = max(1, result)
                }
            }
            i += 1
        }
        return result
    }
}



class Solution_try {
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        let cnt = s.count
        guard cnt >= minSize, minSize <= maxSize else {
            return 0
        }
        var result = 0
        var cntDict = [Character: Int]()
        var occurenceDict = [String: Int]()
        var i = 0
        while i <= cnt - minSize {
            
             let tmp = s[s.index(s.startIndex, offsetBy: i)]
             if let val = cntDict[tmp]{
                cntDict[tmp] = val + 1
             }
             else{
                cntDict[tmp] = 1
             }
             if i > 0{
                let tmplast = s[s.index(s.startIndex, offsetBy: i - 1)]
                if let val = cntDict[tmplast]{
                    if val > 1{
                        cntDict[tmplast] = val - 1
                    }
                    else{
                        cntDict.removeValue(forKey: tmplast)
                    }
                }
             }
             
            
            
            
            
             
            if i > 0{
                
            }
            
            
            
            let from = s[i..<i+minSize]
               
                    
                
            i += 1
        }
            
          
        
        return result
    }
}






// 字符串处理，计算次数，还是要靠哈希表

// 不包含，就包含

// 包含，就 + 1


class Solution_maxFreq_haha{
    
    
    
    
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        let cnt = s.count
        guard cnt >= minSize, minSize <= maxSize else {
            return 0
        }
        var len = minSize
        var result = 0
        while len <= maxSize {
            
            var i = 0
            
            while i <= cnt - len {
                var j = i + 1
                var tmpCnt = 1
                let from = s[i..<i+len]
                if from.maxLetters <= maxLetters{
                    result = max(result, 1)
                    while j <= cnt - len {
                        let to = s[j..<j+len]
                     //   print("from:  ", from)
                       // print("to:  ", to)
                        if from == to{
                            tmpCnt += 1
                            result = max(result, tmpCnt)
                        }
                        j += 1
                    }
                }
                i += 1
            }
            
            len += 1
        }
        
        return result
        
        
    }
    
    
    
    
}




extension Solution_maxFreq_haha{
    
    
    func test(){
        
        
        
        let s = "aababcaab", maxLetters = 2, minSize = 3, maxSize = 4


        let result = Solution_maxFreq_haha().maxFreq(s, maxLetters, minSize, maxSize)


        print("result: \n\n\n", result)


        
        
    }
    
    
}





// c - trip ,   face








/*
 
 // The number of unique characters in the substring must be less than or equal to maxLetters.
 
 // 满足条件一， 唯一出现的字母次数
 
 unordered_map<int,int> count;               //Stores count of letters in the window.
 
 
 // 等价于,    unordered_map<character,int> count;  
 
 
 */
 
 /*
 

 
 
 // 记录我们需要的次数
 unordered_map<string,int> occurence;        //Stores count of occurence of that string.
 
 
 */
