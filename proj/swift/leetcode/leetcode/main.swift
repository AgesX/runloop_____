



import Foundation




class Solution {
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





print("\n\n\n")





var s = "cba", k = 1


let result = Solution().orderlyQueue(s, k)


print(result)
