


import Foundation


class Solution_pathSum_opt{
    
    var result = [[Int]]()
    
    
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let n = root else {
            return []
        }
        pathSumX(n, targetSum, record: [])
        return result
    }
    
    
    func pathSumX(_ root: TreeNode?, _ targetSum: Int, record arrLast: [Int]){
        guard let n = root else {
            fatalError()
        }
        let val = n.val
        let tmp = targetSum - val
        let nowInfo = arrLast + [val]
        if let lhs = n.left{
            pathSumX(lhs, tmp, record: nowInfo)
        }
        if let rhs = n.right{
            pathSumX(rhs, tmp, record: nowInfo)
        }
        if tmp == 0 && n.left == nil && n.right == nil{
            result.append(nowInfo)
        }
    }
}










class Solution_pathSum{
    
    var result = [[Int]]()
    
    
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let n = root else {
            return []
        }
        pathSumX(n, targetSum, record: [])
        return result
    }
    
    
    func pathSumX(_ root: TreeNode?, _ targetSum: Int, record arrLast: [Int]) -> Bool{
        guard let n = root else {
            fatalError()
        }
        let val = n.val
        let tmp = targetSum - val
        let nowInfo = arrLast + [val]
        if let lhs = n.left{
            pathSumX(lhs, tmp, record: nowInfo)
        }
        if let rhs = n.right{
            pathSumX(rhs, tmp, record: nowInfo)
        }
        if tmp == 0 && n.left == nil && n.right == nil{
            result.append(nowInfo)
            return true
        }
        else{
            return false
        }
    }
}




//  113. Path Sum II



extension Solution_pathSum{
    
    
    func test(){
        var arr = [5,4,8,11,null,13,4,7,2,null,null,5,1]

        var target = 22


        let result = Solution_pathSum().pathSum(arr.arrayDenseToNode(), target)

    }
    
    
}



print(result)

print("\n\n\n")



