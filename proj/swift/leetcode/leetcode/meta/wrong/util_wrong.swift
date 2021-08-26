//
//  util_erong.swift
//  leetcode
//
//  Created by Jz D on 2021/8/26.
//

import Foundation








// 乱七八遭
extension Array where Element == Int?{
    
    func arrayDenseToNodePre() -> TreeNode?{
        
        
        var nodes = [TreeNode?]()
        for num in 0..<count{
            if let val = self[num]{
                nodes.append(TreeNode(val))
            }
            else{
                nodes.append(nil)
            }
        }
        
        
        var stack: [Int] = [0]
        var i = 0
        var toEnd = false
        var endIndex = 0
        while i < count{
            if let index = stack.last{
                let left = i + 1
                if left < count{
                    if nodes[left]?.val == nil{
                        let right = left + 1
                        if nodes[right]?.val == nil{
                            nodes[index]?.left = nil
                            nodes[index]?.right = nil
                            stack.popLast()
                            endIndex += 1
                            toEnd = true
                        }
                        else{
                            stack.append(right)
                            nodes[index]?.right = nodes[right]
                        }
                        i += 1
                    }
                    else{
                        stack.append(left)
                        if endIndex == 0{
                            toEnd = false
                        }
                        if toEnd{
                            nodes[index]?.right = nodes[left]
                            endIndex -= 1
                            stack.popLast()
                        }
                        else{
                            nodes[index]?.left = nodes[left]
                            endIndex += 1
                        }
                    }
                }
            }
            i += 1
        }
        return nodes.first!
    }
    
    
}
