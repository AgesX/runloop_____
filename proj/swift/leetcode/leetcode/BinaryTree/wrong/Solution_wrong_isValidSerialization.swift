//
//  Solution_wrong_isValidSerialization.swift
//  leetcode
//
//  Created by Jz D on 2021/8/27.
//

import Foundation











class Solution_wrong_isValidSerialization {
    func isValidSerialization(_ preorder: String) -> Bool {
        var queue = [Int?]()
        for char in preorder{
            switch char {
            case ",":
                ()
            case "#":
                queue.append(nil)
            default:
                if let val = Int(String(char)){
                    queue.append(val)
                }
            }
        }
        let node = queue.arrayDenseToNodePre()
        print(node ?? " _ ")
        return queue.arrayCheckNodePre
    }
}




extension Solution_wrong_isValidSerialization{
    
    func test(){
        
        
        var input = "9,3,4,#,#,1,#,#,2"

        input = "9,3,4,#,#,1,#,#,2,#,6,#,#"

        input = "1,#"

        input = "9,#,#,1"

        input = "1"

        input = "9,3,4,#,#,1,#,#,2,#,6,#,#"

        input = "1,#,#"

        print(Solution_wrong_isValidSerialization().isValidSerialization(input))



    }
    
    
    
}







