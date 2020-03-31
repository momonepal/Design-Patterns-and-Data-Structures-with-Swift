//  Stacks And Queues Implementation
//  Created by Mohit
//  Copyright © 2020 Mohit. All rights reserved.

import Foundation

class Stack<T> {
    var array : [T] = []
    
    func push(element: T) {
        array.append(element)
    }
    
    func pop() -> T? {
        if !array.isEmpty {
            return array.popLast()
        } else {
            return nil
          }
    }
    
    func peek() -> T? {
        if !array.isEmpty {
            return array.last
        } else {
            return nil
          }
    }
    
    func clear(){
        array = []
    }
    
    var size : Int{
        return array.count
    }
    
    var isEmpty : Bool{
        return array.isEmpty
    }
        
    init() {
    }

}

class Queue<T>{
    var array : [T] = []
    
    init() {
    }
    
    func enqueue( element : T ){
        array.append(element)
    }
    
    func dequeue() -> T?{
        if !array.isEmpty{
            return array.removeFirst()
        }else{
            return nil
        }
    }
    
    func front() -> T?{
        if !array.isEmpty {
                return array.first
            } else {
                return nil
              }
        }
    
    func clear(){
        array = []
    }
    
    var size : Int{
        return array.count
    }
    
    var isEmpty : Bool{
        return array.isEmpty
    }
}

