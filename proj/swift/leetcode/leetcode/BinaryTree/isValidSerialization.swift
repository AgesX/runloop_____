//
//  isValidSerialization.swift
//  leetcode
//
//  Created by Jz D on 2021/8/27.
//

import Foundation





class Solution_isValidSerialization {
    func isValidSerialization(_ preorder: String) -> Bool {
        let nodes = preorder.components(separatedBy: ",")
        var diff = 1
        for node in nodes{
            diff -= 1
            if diff < 0{
                return false
            }
            if node != "#"{
                diff += 2
            }
        }
        
        return diff == 0
        
        
    }
}





extension Solution_isValidSerialization{
    
    
    func test(){
    
        var result = Solution_isValidSerialization().isValidSerialization("9,#,92,#,#")

        print(result)


    }
}







class Solution_twoXxx_wrong {
    func isValidSerialization(_ preorder: String) -> Bool {
        var diff = 1
        var sub = ""
        for char in preorder{
            if char == ","{
                sub = ""
            }
            else{
                print(char)
                diff -= 1
                if diff < 0{
                    return false
                }
                if char != "#"{
                    diff += 2
                }
            }
        }
        print(diff)
        return diff == 0
    }
    
    

}


extension Solution_twoXxx_wrong{
    
    
    func test(){
    
        var result = Solution_twoXxx_wrong().isValidSerialization("9,#,92,#,#")

        print(result)


    }
}








//  331. Verify Preorder Serialization of a Binary Tree


