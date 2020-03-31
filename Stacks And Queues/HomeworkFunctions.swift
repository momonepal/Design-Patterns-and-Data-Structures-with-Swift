//
//  HomeworkFunctions.swift
//  StacksAndQueues
//  Created by Mohit
//  Copyright © 2020 Mohit. All rights reserved.

import Foundation

class HomeworkFunctions{
    
    //level 1
    
    func hasCorrectDelimiters(_ string : String ) -> Bool{
        let stack = Stack<String>()
        for bracket in string {
            switch bracket {
                case "[","(","{":
                    stack.push(element: String(bracket))
                case "]",")","}":
                    if stack.isEmpty || stack.pop() == nil || (bracket == "}" && stack.peek() != "{") || (bracket == "]" && stack.peek() != "[") || (bracket == ")" && stack.peek() != "(")  {
                        return false
                    }
                    stack.pop()
            default: break
            }
        }
        if stack.isEmpty{
            return true
        }else{
            return false
            }
    }
    
    //Level 2
    
    func isAPalindrome(_ string : String ) -> Bool{
        let stack = Stack<String>()
        let queue = Queue<String>()
        for character in string.replacingOccurrences(of: " ", with: "").lowercased(){
            stack.push(element : String(character))
            queue.enqueue(element: String(character))
        }
        for _ in string.replacingOccurrences(of: " ", with: ""){
            if stack.pop() == queue.dequeue() {}
            else{
                return false
            }
        }
        return true
    }
    



}
