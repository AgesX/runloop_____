//
//  MinStack.swift
//  interview
//
//  Created by Jz D on 2021/10/25.
//

import Foundation


class Min_stack{

class MinStack{
    
    
    var arr: [Int]
    var register: [Int]

    init(){
        arr = []
        register = []
    }
    
    func push(_ val: Int){
        arr.append(val)
        if let final = register.last{
            if val <= final{
                register.append(val)
            }
        }
        else{
            register.append(val)
        }
    }
    
    func pop(){
        let val = arr.removeLast()
        if let final = register.last, final == val{
            register.removeLast()
        }
    }
    
    func top() -> Int{
        return arr.last ?? -1
    }
    
    func getMin() -> Int{
        return register.last ?? -1
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */


var val: Int = -1{
    didSet{
        print(val)
    }
}

    func test(){
        let minStack = MinStack()
        minStack.push(-2)
        minStack.push(0)
        minStack.push(-3)
        val = minStack.getMin() // return -3

        minStack.pop()
        val = minStack.top()    // return 0
        val = minStack.getMin() // return -2
    }



}
