//
//  util_erong.swift
//  leetcode
//
//  Created by Jz D on 2021/8/26.
//

import Foundation









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
                        }
                        else{
                            stack.append(right)
                            nodes[index]?.right = nodes[right]
                        }
                        i += 1
                    }
                    else{
                        if nodes[index]?.left == nil{
                            nodes[index]?.left = nodes[left]
                        }
                        else{
                            nodes[index]?.right = nodes[left]
                            stack.popLast()
                        }
                        stack.append(left)
                    }
                }
            }
            i += 1
        }
        return nodes.first!
    }
    
    
}





// 乱七八糟， 彻底放弃


extension Array where Element == Int?{
    
    var arrayCheckNodePre: Bool{
        
        
        var nodes = [TreeNode?]()
        for num in 0..<count{
            if let val = self[num]{
                nodes.append(TreeNode(val))
            }
            else{
                nodes.append(nil)
            }
        }
        
        guard count > 2 else {
            if count == 1, nodes[0] == nil{
                return true
            }
            else{
                return false
            }
            
        }
        
        
        
        var stack: [Int] = [0]
        var i = 0
        var isEnd = false
        while i < count - 2{
            isEnd = false
            if let index = stack.last{
                let left = i + 1
                if left < count{
                    if nodes[left]?.val == nil{
                        let right = left + 1
                        if right < count{
                            if nodes[right]?.val == nil{
                                nodes[index]?.left = nil
                                nodes[index]?.right = nil
                                isEnd = true
                                if stack.isEmpty{
                                    return false
                                }
                                else{
                                    stack.popLast()
                                    if stack.isEmpty, right + 1 < count{
                                        print(nodes[0] ?? "  ")
                                        return false
                                    }
                                }
                            }
                            else{
                                if nodes[index] == nil{
                                    return false
                                }
                                stack.append(right)
                                nodes[index]?.right = nodes[right]
                            }
                            i += 1
                        }
                        else{
                            return false
                        }
                    }
                    else{
                        if nodes[index] == nil{
                            return false
                        }
                        if nodes[index]?.left == nil{
                            nodes[index]?.left = nodes[left]
                        }
                        else{
                            nodes[index]?.right = nodes[left]
                            if stack.isEmpty{
                                return false
                            }
                            else{
                                stack.popLast()
                            }
                        }
                        stack.append(left)
                    }
                }
            }
            i += 1
        }
        
        
        while stack.isEmpty == false{
            if nodes[stack[0]]?.left != nil, nodes[stack[1]]?.right != nil{
                stack.removeFirst()
            }
            else if isEnd, nodes[stack[0]]?.right != nil{
                stack.removeFirst()
            }
            else{
                break
            }
        }
  //      print(nodes[stack[0]] ?? "X")
        return stack.isEmpty
    }
    
    
}



