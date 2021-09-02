



import Foundation






let arr: [Int?] = [3,1,4,3, nil,1,5]

let node = arr.arrayToTree()

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


print(node ?? "  ")
print("\n\n")
print(inorder(visitor: node))


print("\n\n\n")




