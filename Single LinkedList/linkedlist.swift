//  linkedlist
//  Created by Mohit
//  Copyright © 2020 Mohit. All rights reserved.

import Foundation

class Node<T : Equatable>{
    var element : T
    var nextNode : Node<T>?
  //var tailNode : Node?
    init(element : T) {
        self.element = element
    }
}

class LinkedList<T : Equatable> {
    var head : Node<T>?
    
    var tail : Node<T>?{
        guard  var node = head else{
            return nil
        }
        while let nextNode = node.nextNode {
            node = nextNode
        }
        return node
    }
    
    
    init() {
    }

    func insert(element : T) {
        let newNode = Node(element: element)
        if head?.element == nil {
            head = newNode
        }
        else {
            var testNode = head!
            while testNode.nextNode != nil {
                testNode = testNode.nextNode!
            }
            testNode.nextNode = newNode
            //tail = newNode
        }
    }
    
    func printLinkedList(){ //prints linked list
        var testNode = head
        while testNode?.nextNode != nil {
            if let nodeToPrint = testNode?.element {
                print(nodeToPrint)
            }
            testNode = testNode?.nextNode!
        }
        
        if let nodeToPrint = testNode?.element {
            print(nodeToPrint)
        }
    }
  
    var firstElement : T? {
        get {
            return head?.element
        }
    }

    var lastElement2 : T? {//using tail pointer
        get {
            return tail?.element
        }
    }

    var lastElement : T? { //using only head  pointer
        get {
            var testNode = head
            while testNode?.nextNode != nil {
                testNode = testNode?.nextNode!
            }
            return testNode?.element
        }
    }
    
  

    var length : Int {
        get {
            var counter = 0
            if head?.element != nil{
                counter = 1
            }
            var testNode = head
            while testNode?.nextNode != nil {
                testNode = testNode?.nextNode!
                counter += 1
            }
            return counter
        }
    }

    func insertAtHead(element : T) {
        let newNode = Node(element: element)
        if head?.element == nil {
            head = newNode
        }
        else {
            newNode.nextNode = head
            head = newNode
        }
    }

    func insertAtTail(element : T) {
        let newNode = Node(element: element)
        if head?.element == nil {
            head = newNode
        }
        else {
            var testNode = head!
            while testNode.nextNode != nil {
                testNode = testNode.nextNode!
            }
            testNode.nextNode = newNode     }
    }
    
    func removeFromHead() {
        head = head?.nextNode
    }

    func removeFromTail() {
        if head?.nextNode == nil {   // fixed the error
            head = nil
        }
        else {
            var testNode = head!
            while testNode.nextNode?.nextNode != nil {
                testNode = testNode.nextNode!
            }
            testNode.nextNode = nil
        }
    }
    
    func toArray() -> [T] {
        var array = [T]()
        if head == nil {
            return []
        }
        var testNode = head!
        if head != nil {
            array.append(testNode.element)
        }
        while testNode.nextNode != nil {
            testNode = testNode.nextNode!
            array.append(testNode.element)
        }
        return array
    }

    func append(list : LinkedList) {
        if head?.element == nil{
            head = list.head
        }
        else{
            var testNode = head!
            while testNode.nextNode != nil {
                testNode = testNode.nextNode!
            }
            testNode.nextNode = list.head
        }
    }
    
    func search(element : T) -> Int? { //returns index counting from 0
        var counter = 1
        var indexx : Int? = nil
        var testNode = head
        if testNode!.element == element {
            indexx = 0
        }
        while testNode?.nextNode != nil {
            testNode = testNode?.nextNode!
            if testNode!.element == element {
                let indexx = counter
                return indexx
            }
            
            counter += 1
        }
        return indexx //returns nil if searched elemnt doesnt exist
    }
    
    func insertAt(index : Int,element : T ){
        let newNode = Node(element: element)
        if head?.element == nil {
            head = newNode
        }
        else {
            if index == 0 {
                newNode.nextNode = head
                head = newNode
            }
            else {
                var testNode = head!
                for _ in 1..<index {
                    testNode = testNode.nextNode!
                }
                newNode.nextNode = testNode.nextNode
                testNode.nextNode = newNode
            }
        }
    }
    
    func removeFrom(index : Int) {
        if head?.nextNode == nil {
            head = nil
        }
        else {
            if index == 0 {
                head = head?.nextNode
            }
            else {
                var testNode = head!
                for _ in 1..<index {
                    testNode = testNode.nextNode!
                }
                testNode.nextNode = testNode.nextNode?.nextNode
            }
        }
    }
    
    func searchForAll(element : T) -> [Int] {
        var counter = [Int]()
        var index = 0
        var testNode = head
        while testNode?.nextNode != nil {
            if testNode!.element == element {
                counter.append(index)
            }
            index += 1
            testNode = testNode?.nextNode!
        }
        if testNode!.element == element {
            counter.append(index)
        }
        return counter
    }
}
