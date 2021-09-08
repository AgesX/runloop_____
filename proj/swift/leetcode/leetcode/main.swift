


import Foundation

class Solution_Time_Limit_three{
    
    // Time Limit
    
    
    
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        guard m > 0 else {
            return 0
        }
        let n = grid[0].count
        guard n > 0 else {
            return 0
        }
        var lands = Set<Pos>()
        var i = 0
        while i < m {
            var j = 0
            while j < n {
                let cake = Pos(x: i, y: j)
                if grid[i][j] == "1"{
                    lands.insert(cake)
                }
                j += 1
            }
            i += 1
        }
        
        
        
        var result = 0
        
        let haha = lands
        while lands.isEmpty == false {
            print(lands)
            let begin = lands.removeFirst()
            print(begin)
            var queue = [begin]
            while queue.isEmpty == false {
                let first = queue.removeFirst()
                if first.x > 0{
                    let lhs = first.lhs
                    if lands.contains(lhs), lhs.hitOne(in: grid){
                        lands.remove(lhs)
                        queue.append(lhs)
                    }
                }
                if first.y > 0{
                    let up = first.up
                    if lands.contains(up), up.hitOne(in: grid){
                        lands.remove(up)
                        queue.append(up)
                    }
                }
                if first.x < m - 1{
                    let rhs = first.rhs
                    if lands.contains(rhs), rhs.hitOne(in: grid){
                        lands.remove(rhs)
                        queue.append(rhs)
                    }
                }
                if first.y < n - 1{
                    let down = first.down
                    if lands.contains(down), down.hitOne(in: grid){
                        lands.remove(down)
                        queue.append(down)
                    }
                }
                print(111, lands.symmetricDifference(haha))
            }
            
            result += 1
        }
        return result
    }
    
}


class Solution_Time_Limit_two{
    
    // Time Limit
    
    
    
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        guard m > 0 else {
            return 0
        }
        let n = grid[0].count
        guard n > 0 else {
            return 0
        }
        var lands = Set<Pos>()
        for collect in grid.enumerated(){
            for ele in collect.element.enumerated(){
                let cake = Pos(x: collect.offset, y: ele.offset)
                if ele.element == "1"{
                    lands.insert(cake)
                }
            }
        }
        
        
        var result = 0
        
        let haha = lands
        while lands.isEmpty == false {
            print(lands)
            let begin = lands.removeFirst()
            print(begin)
            var queue = [begin]
            while queue.isEmpty == false {
                let first = queue.removeFirst()
                if first.x > 0{
                    let lhs = first.lhs
                    if lands.contains(lhs), lhs.hitOne(in: grid){
                        lands.remove(lhs)
                        queue.append(lhs)
                    }
                }
                if first.y > 0{
                    let up = first.up
                    if lands.contains(up), up.hitOne(in: grid){
                        lands.remove(up)
                        queue.append(up)
                    }
                }
                if first.x < m - 1{
                    let rhs = first.rhs
                    if lands.contains(rhs), rhs.hitOne(in: grid){
                        lands.remove(rhs)
                        queue.append(rhs)
                    }
                }
                if first.y < n - 1{
                    let down = first.down
                    if lands.contains(down), down.hitOne(in: grid){
                        lands.remove(down)
                        queue.append(down)
                    }
                }
                print(111, lands.symmetricDifference(haha))
            }
            
            result += 1
        }
        return result
    }
    
}


class Solution_numIslands_Time_Limit {
    
    // Time Limit
    
    
    
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        guard m > 0 else {
            return 0
        }
        let n = grid[0].count
        guard n > 0 else {
            return 0
        }
        var hasVisited = Set<Pos>()
        var begin: Pos?
        var result = 0
        repeat{
            begin = nil
            Outer: for collect in grid.enumerated(){
                for ele in collect.element.enumerated(){
                    let cake = Pos(x: collect.offset, y: ele.offset)
                    if hasVisited.contains(cake) == false, ele.element == "1"{
                        begin = cake
                        result += 1
                        break Outer
                    }
                }
            }
            guard let start = begin else{
                return result
            }
            var queue = [start]
            hasVisited.insert(start)
            while queue.isEmpty == false {
                let first = queue.removeFirst()
                if first.x > 0{
                    let lhs = first.lhs
                    if lhs.hitOne(in: grid), hasVisited.contains(lhs) == false{
                        hasVisited.insert(lhs)
                        queue.append(lhs)
                    }
                }
                if first.y > 0{
                    let up = first.up
                    if up.hitOne(in: grid), hasVisited.contains(up) == false{
                        hasVisited.insert(up)
                        queue.append(up)
                    }
                }
                if first.x < m - 1{
                    let rhs = first.rhs
                    if rhs.hitOne(in: grid), hasVisited.contains(rhs) == false{
                        hasVisited.insert(rhs)
                        queue.append(rhs)
                    }
                }
                if first.y < n - 1{
                    let down = first.down
                    if down.hitOne(in: grid), hasVisited.contains(down) == false{
                        hasVisited.insert(down)
                        queue.append(down)
                    }
                }
            }
        }while ( begin != nil )
        return result
    }
    
    
    
    
    
    
    
    
}












var grid: [[Character]] = [["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]]


grid = [["1","1","0","0","0"],
["1","1","0","0","0"],
["0","0","1","0","0"],
["0","0","0","1","1"]]


let result = Solution_Time_Limit_three().numIslands(grid)

print(result)
















class Solution_findMedianSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let lhsCnt = nums1.count
        let rhsCnt = nums2.count
        let lhsOver = lhsCnt > 0
        let rhsOver = rhsCnt > 0
        guard lhsOver || rhsOver else {
            return 0
        }
        guard lhsOver else {
            return nums2.mid
        }
        guard rhsOver else {
            return nums1.mid
        }
        var lhsIdx = lhsCnt / 2
        let isOdd = ((lhsCnt + rhsCnt) % 2 == 1)
        while true {
            let rhsIdx = (lhsCnt + rhsCnt)/2 - lhsIdx
            
            var lhsIfOne = true
            let rhsIdxBack = rhsIdx - 1
            if rhsIdxBack >= 0{
                lhsIfOne = nums1[lhsIdx] >= nums2[rhsIdxBack]
            }
            
            var rhsIfOne = true
            let rhsIdxForward = rhsIdx + 1
            if rhsIdxForward < rhsCnt{
                rhsIfOne = nums1[lhsIdx] <= nums2[rhsIdxForward]
            }
            switch (lhsIfOne, rhsIfOne){
            case (true, true):
                if isOdd{
                    return Double(min(nums1[lhsIdx], nums2[rhsIdx]))
                }
                else{
                    return Double(nums1[lhsIdx] + nums2[rhsIdx])/2
                }
            case (true, false):
                if lhsIdx <= 0{
                    let newArr = nums2 + nums1
                    return newArr.mid
                }
                lhsIdx -= 1
            case (false, true):
                if lhsIdx >= lhsCnt - 1{
                    let newArr = nums1 + nums2
                    return newArr.mid
                }
                lhsIdx += 1
            case (false, false):
                fatalError()
            }
            
        }
        fatalError()
    }
}











extension Array where Element == Int{
    var mid: Double{
        let mid = count / 2
        if count % 2 == 0{
            return Double(self[mid] + self[mid-1])/2
        }
        else{
            return Double(self[mid])
        }
    }
}




print("\n\n\n")











extension Solution_findMedianSortedArrays{
    
    
    func test(){
        
        
        var nums1 = [1,3], nums2 = [2]

        do{
            nums1 = [1,2]
            nums2 = [3,4]
        }


        do{
            nums1 = [0,0]
            nums2 = [0,0]
            
        }

        do{
            nums1 = [0,0,0,0,0]
            nums2 = [-1,0,0,0,0,0,1]
        }




        do{
            nums1 = [1,3]
            nums2 = [2,7]
        }








        let result = Solution_findMedianSortedArrays().findMedianSortedArrays(nums1, nums2)


        print(result)

        
        
    }
    
}


