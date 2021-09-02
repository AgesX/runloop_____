//
//  inorder.swift
//  leetcode
//
//  Created by Jz D on 2021/9/2.
//

import Foundation






// 深度优先
func inorder(visitor node: TreeNode?) -> [Int]{
    guard let n = node else {
        return []
    }
    var result = [Int]()
    if let lhs = node?.left{
        result += inorder(visitor: lhs)
    }
    result.append(n.val)
    if let rhs = node?.right{
        result += inorder(visitor: rhs)
    }
    return result
}







func test_dsf(){
    
    let arr: [Int?] = [3,1,4,3, nil,1,5]

    let node = arr.arrayToTree()

    print(node ?? "  ")
    print("\n\n")
    print(inorder(visitor: node))
    
}







// DSF

// Deep Search First

// 深度优先



// 递归函数的参数，

// 父节点，给子节点，传递的信息，通过参数的形式





// 递归函数的返回，

// 子节点，给父节点，传递的信息，通过函数的返回值的形式
