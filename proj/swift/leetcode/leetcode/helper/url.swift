//
//  url.swift
//  leetcode
//
//  Created by Jz D on 2021/8/17.
//

import Foundation



class Web{
    
    
    
    
    func output(for input: String) -> String{
        
        
        let one = input.components(separatedBy: CharacterSet.decimalDigits).joined()
        let two = one.components(separatedBy: ".").joined()
        let three = two.components(separatedBy: " ").joined(separator: "-").lowercased()
        return "https://leetcode.com/problems/\(three.deletingPrefix("-"))/"
    }

    
}


extension Web{


    func test(){
        var input = "1448. Count Good Nodes in Binary Tree"

        //  https://leetcode.com/problems/count-good-nodes-in-binary-tree/
        
        input = "653. Two Sum IV - Input is a BST"
        
        //  https://leetcode.com/problems/two-sum-iv-input-is-a-bst/

        let result = output(for: input)

        print(result)



        


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
