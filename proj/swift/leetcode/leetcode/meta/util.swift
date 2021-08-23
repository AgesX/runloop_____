//
//  util.swift
//  leetcode
//
//  Created by Jz D on 2021/8/17.
//

import Foundation




extension Array where Element == Int{
    
    func arrayToTree() -> TreeNode{

        let cnt = count
        var nodes = [TreeNode]()
        for num in 0..<cnt{
            nodes.append(TreeNode(self[num]))
        }
        
        
        var i = 0
        repeat{
            if 2 * i + 1 < cnt{
                nodes[i].left = nodes[2 * i + 1]
            }
            if 2 * i + 2 < cnt{
                nodes[i].right = nodes[2 * i + 2]
            }
            i+=1
        }while i < (self.count)/2
 
        return nodes.first!
    }
    
    
    func arrayToLinkedList() -> ListNode{
        
        
        var nodes = [ListNode]()
        let cnt = count
        for num in 0..<cnt{
            nodes.append(ListNode(self[num]))
        }
        if cnt - 2 > 0{
            for i in 0...cnt-2{
                nodes[i].next = nodes[i+1]
            }
        }
        
        return nodes.first!
    }
    
    
}






extension Array where Element == Int?{
    
    func arrayToTree() -> TreeNode?{
        
        
        var nodes = [TreeNode?]()
        for num in 0..<count{
            if let val = self[num]{
                nodes.append(TreeNode(val))
            }
            else{
                nodes.append(nil)
            }
        }
        
        
        var i = 0
        repeat{
            nodes[i]?.left = nodes[2 * i + 1]
            nodes[i]?.right = nodes[2 * i + 2]
            i+=1
        }while i < (self.count)/2
        
        return nodes.first!
    }
    
    
}






extension Array where Element == Int?{
    
    func arrayDenseToNode() -> TreeNode?{
        
        
        var nodes = [TreeNode?]()
        for num in 0..<count{
            if let val = self[num]{
                nodes.append(TreeNode(val))
            }
            else{
                nodes.append(nil)
            }
        }
        
        
        var queue: [Int] = [0]
        var edge = 0
        while queue.isEmpty == false {
            let index = queue.removeFirst()
            let left = edge + 1
            let right = edge + 2
            if left < count, nodes[left]?.val != nil{
                queue.append(left)
                nodes[index]?.left = nodes[left]
            }
            if right < count, nodes[right]?.val != nil{
                queue.append(right)
                nodes[index]?.right = nodes[right]
            }
            edge += 2
        }
        return nodes.first!
    }
    
    
}











extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
    
    
    
    var maxLetters: Int{
        var set = Set<Character>()
        for char in self{
            set.insert(char)
        }
        return set.count
    }
    
    
}




extension Substring {

    var maxLetters: Int{
        return Set(self).count
    }
    
    
    var maxL: Int{
        var set = Set<Character>()
        for char in self{
            set.insert(char)
        }
        return set.count
    }
    
    
}
