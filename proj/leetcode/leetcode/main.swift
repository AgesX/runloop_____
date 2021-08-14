
import Foundation





class MinStack {

    
    var container = [Int]()
    
    var alongContainer = [Int]()
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ val: Int) {
        container.append(val)
        if let last = alongContainer.last{
            if last >= val{
                alongContainer.append(val)
            }
        }
        else{
            alongContainer.append(val)
        }
    }
    
    func pop() {
        guard container.isEmpty == false else {
            return
        }
        let val = container.removeLast()
        if let last = alongContainer.last, last == val{
            alongContainer.removeLast()
        }
    }
    
    func top() -> Int {
        if let top = container.last{
            return top
        }
        else{
            return -1
        }
    }
    
    func getMin() -> Int {
        if let top = alongContainer.last{
            return top
        }
        else{
            return 666
        }
    }
}




let minS = MinStack()

minS.push(-2)
minS.push(0)
minS.push(-3)


var tmp = minS.getMin()

print(1, tmp)

minS.pop()

tmp = minS.top()


print(2, tmp)


tmp = minS.getMin()


print(3, tmp)
