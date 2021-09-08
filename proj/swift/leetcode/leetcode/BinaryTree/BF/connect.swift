//
//  connect.swift
//  leetcode
//
//  Created by Jz D on 2021/9/8.
//

import Foundation





// Definition for a Node


public class Node {
    
    
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    
    
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}








class Solution_connect {
    
    
    func connect(_ root: Node?) -> Node? {
        guard let node = root else {
            return nil
        }
        var levelQueue = [node]
        while levelQueue.isEmpty == false {
            var nextQueue = [Node]()
            while levelQueue.isEmpty == false {
                let first = levelQueue.removeFirst()
                if levelQueue.first != nil{
                    first.next = levelQueue.first
                }
                if let lhs = first.left{
                    nextQueue.append(lhs)
                }
                if let rhs = first.right{
                    nextQueue.append(rhs)
                }
            }
            levelQueue = nextQueue
        }
        return node
    }
    
    
}




// 116. Populating Next Right Pointers in Each Node




//  117. Populating Next Right Pointers in Each Node II
