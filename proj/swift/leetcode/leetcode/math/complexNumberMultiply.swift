//
//  complexNumberMultiply.swift
//  leetcode
//
//  Created by Jz D on 2021/8/25.
//

import Foundation







class Solution_complexNumberMultiply {
    func complexNumberMultiply(_ num1: String, _ num2: String) -> String {
        let sep = "+"
        let left = num1.components(separatedBy: sep)
        let right = num2.components(separatedBy: sep)
        let lhsReal = left[0].real
        let lhsVirtual = left[1].virtual
        let rhsReal = right[0].real
        let rhsVirtual = right[1].virtual
     //   print(lhsReal, lhsVirtual, rhsReal, rhsVirtual)
        let finaReal = lhsReal * rhsReal - lhsVirtual * rhsVirtual
        let finalVirtual = lhsReal * rhsVirtual + rhsReal * lhsVirtual
        return "\(finaReal)+\(finalVirtual)i"
    }
    
}





extension Solution_complexNumberMultiply{
    
    
    func test(){
        
        
        let result = Solution_complexNumberMultiply().complexNumberMultiply("1+1i", "1+1i")


        print(result)

        
        
    }
    
}



extension String{
    var real: Int{
        if hasPrefix("-"){
            return (Int(self[1...]) ?? 0) * (-1)
        }
        else{
            return Int(self) ?? 0
        }
    }
    
    var virtual: Int{
        let end = index(startIndex, offsetBy: count - 1)
        if hasPrefix("-"){
            let second = index(startIndex, offsetBy: 1)
            return (Int(self[second..<end]) ?? 0) * (-1)
        }
        else{
            return Int(self[startIndex..<end]) ?? 0
        }
    }
}





//  537. Complex Number Multiplication
