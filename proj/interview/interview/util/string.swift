//
//  string.swift
//  interview
//
//  Created by Jz D on 2021/10/11.
//

import Foundation




extension String{
    subscript(at i: Int) -> String? {
            get {
                if i < count{
                    let idx = index(startIndex, offsetBy: i)
                    return String(self[idx])
                }
                else{
                    return nil
                }
            }
            set {
                if i < count{
                    let idx = index(startIndex, offsetBy: i)
                    remove(at: idx)
                    if let new = newValue, let first = new.first{
                        insert(first, at: idx)
                    }
                }
            }
        }
}







func testOne(){
    
    
    
    var str = "fighter"

    str[at: 2] = "666"

    print(str)

}
