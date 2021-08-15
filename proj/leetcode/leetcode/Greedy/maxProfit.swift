//
//  maxProfit.swift
//  leetcode
//
//  Created by Jz D on 2021/8/15.
//

import Foundation



class Solution_maxP {
    func maxProfit(_ prices: [Int]) -> Int {
        let cnt = prices.count
        var result = 0
        var i = 0
        var buyPrice: Int?
        while i < cnt{
            let lhs = prices[i]
            if i + 1 < cnt{
                
                let rhs = prices[i + 1]
                
                if let cost = buyPrice{
                    if lhs > rhs, lhs > cost{
                        result += lhs - cost
                        buyPrice = nil
                    }
                }
                else if lhs < rhs{
                    buyPrice = lhs
                }
                
            }
            else{
                // handle the last
                
                if let cost = buyPrice, lhs > cost{
                    result += lhs - cost
                    buyPrice = nil
                }
                
            }
            i += 1
        }
        
        
        return result
    }
}




extension Solution_maxP{
    
    
    
    
    func test(){
        
        
        
        
        var arr = [7,1,5,3,6,4]
        // arr = [1,2,3,4,5]
        // arr = [7,6,4,3,1]


        let result = Solution_maxP().maxProfit(arr)


        print(result)

        
        
    }
}










// 122. Best Time to Buy and Sell Stock II


// 解法，很过程，很直观
