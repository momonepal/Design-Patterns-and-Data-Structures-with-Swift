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
                    if stack.isEmpty || (bracket == "}" && stack.peek() != "{") || (bracket == "]" && stack.peek() != "[") || (bracket == ")" && stack.peek() != "(")  {
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
        var array : [String] = []
        let stack = Stack<String>()
        let queue = Queue<String>()
        for character in string.lowercased(){
            if "abcdefghijklmnopqrstuvwxyz".contains(character){
                array.append(String(character))
                stack.push(element : String(character))
                queue.enqueue(element: String(character))
            }
        }
        if array.count != 0{
            for _ in array{
                if stack.pop() == queue.dequeue(){}
                else{
                return false
                }
            }
        }else{
            print("String is empty")
            return false
        }
        return true
    }
    



}
