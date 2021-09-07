



import Foundation


class Solution_orderlyQueue_copy {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        if k > 1{
            let arr = (Array(s).sorted { lhs, rhs in
                lhs.ascII_scalar < rhs.ascII_scalar
            }).map { String($0) }
            return arr.joined(separator: "")
        }
        else{
            let cnt = s.count
            guard cnt > 1 else {
                return s
            }
            var i = 1
            var result = s
            while i < cnt {
                let next = "\(s[i...])\(s[0..<i])"
                if result.compare(next, options: .caseInsensitive) == .orderedDescending{
                    result = next
                }
                i += 1
            }
            return result
        }
    }
}


class Solution_orderlyQueue_wrong {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        let cnt = s.count
        guard cnt > 0, k > 0 else {
            return s
        }
        var limit = k
        if limit > cnt{
            limit = cnt
        }
        let start = s.startIndex
        var result = s
        var ok = true
        while ok {
            var i = 1
            var loopOK = false
            var choose = 0
            while i < cnt {
                if s[s.index(start, offsetBy: i)].ascII_scalar > s[s.index(start, offsetBy: choose)].ascII_scalar{
                    loopOK = true
                    if i < k{
                        choose = i
                    }
                }
                if loopOK{
                    ok = false
                }
                i += 1
            }
            if loopOK == false{
                let char = result.remove(at: result.index(start, offsetBy: choose))
                result.append(char)
            }
        }
        return result
        
    }
}




extension Solution_orderlyQueue_copy{
    
    func test(){
        
        var s = "cba", k = 1


        let result = Solution_orderlyQueue_copy().orderlyQueue(s, k)


        print(result)
    }
    
}





//  899. Orderly Queue

