//
//  main.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation



class BSTIterator {

    
    let arr: [Int]
    var forward = 0
    let count: Int
    
    init(_ root: TreeNode?) {
        var array = [Int]()
        func dfs(_ node: TreeNode?){
            guard let n = node else { return }
            dfs(n.left)
            array.append(n.val)
            dfs(n.right)
        }
        dfs(root)
        //
        arr = array
        count = array.count
    }
    
    
    
    func next() -> Int{
        let val = arr[forward]
        forward += 1
        return val
    }
    
    func hasNext() -> Bool {
        return forward < count
    }
}
