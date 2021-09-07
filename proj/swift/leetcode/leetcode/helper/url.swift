//
//  url.swift
//  leetcode
//
//  Created by Jz D on 2021/8/17.
//

import Foundation


import Cocoa



class Web{
    
    
    
    
    func output(for input: String) -> String{
        let sep: String.Element = "-"
        let empty: String.Element = " "
        let startSet: [String.Element] = [".", empty]
        var result = ""
        var begins = false
        for char in input{
            if startSet.contains(char) == false, char.isNum == false{
                begins = true
            }
            if begins{
                switch char {
                case empty:
                    result.append(sep)
                default:
                    result.append(char)
                }
            }
        }
        let secondary = String(repeating: sep, count: 3)
        result = result.components(separatedBy: secondary).joined(separator: String(sep))
        return "https://leetcode.com/problems/\(result.lowercased())/"
    }

    
}


extension Web{


    func test(){
        var input = "1448. Count Good Nodes in Binary Tree"

        var result = output(for: input)
        var one = "https://leetcode.com/problems/count-good-nodes-in-binary-tree/"
        
   //     assert(one == result, "ha ha 1")
     //   print(result)
        input = "653. Two Sum IV - Input is a BST"
        
        
        result = output(for: input)
        one = "https://leetcode.com/problems/two-sum-iv-input-is-a-bst/"
     //   assert(one == result, "ha ha 2")
        

     //   print(result)



      //  input = "Complex Number Multiplication"
        
        
        
        input = "Verify Preorder Serialization of a Binary Tree"
        
        input = "565. Array Nesting"
        
        
        input = "Slowest Key"
        
        
        input = "Orderly Queue"
        result = output(for: input)
        
        print(result)
        
        
        if let url = URL(string: result) {
            NSWorkspace.shared.open(url)
        }
        
        
        
        


        // en page
    }

    
    
    
}





extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard hasPrefix(prefix) else { return self }
        let result = String(dropFirst(prefix.count))
        return result.deletingPrefix(prefix)
    }
    
    
 
}





extension Character {
    
    var isNum: Bool{
        if let scalar = wholeNumberValue, scalar >= 0, scalar <= 9{
            return true
        }
        else{
            return false
        }
    }
    
    
}
