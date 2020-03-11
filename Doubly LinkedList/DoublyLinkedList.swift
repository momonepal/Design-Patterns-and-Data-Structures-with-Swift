//
//  DoublyLinkedList.swift
//  doubleLinkedList
//
//  Created by Student on 3/11/20.
//  Copyright © 2020 mohit. All rights reserved.
//

import Foundation

class Node<T : Equatable>{
  var element : T
  var nextNode : Node<T>?
  weak var prevNode : Node<T>? //to prevent ownership cycle--break the cycle
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

    func insert(element : T) { //creates nodes
    let newNode = Node(element: element)
    if head?.element == nil { //checks if Linkedlist is empty
        head = newNode
    }
    else {
      var testNode = head!
      while testNode.nextNode != nil {
        testNode = testNode.nextNode!
      }
      testNode.nextNode = newNode
      newNode.prevNode = testNode
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
  
  var firstElement : T? { //prints first element
    get {
      return head?.element
    }
  }

  var lastElement : T? {// prints last element using tail pointer
    get {
      return tail?.element
    }
  }

  var lastElement2 : T? { //using only head  pointer
    get {
      var testNode = head
      while testNode?.nextNode != nil {
        testNode = testNode?.nextNode!
      }
        return testNode?.element
    }
  }
    
  

  var length : Int { //prints length of the node
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

  func insertAtHead(element : T) { //inserts a node at head
       let newNode = Node(element: element)
       if head?.element == nil {
         head = newNode
       }
       else {
        newNode.nextNode = head
        head!.prevNode = newNode
        head = newNode
       }
    }

  func insertAtTail(element : T) { //inserts a node at tail
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
       newNode.prevNode = testNode
    }
   }
       
    func removeFromHead() { //removes node from head
      //head?.nextNode?.nextNode?.prevNode = head?.nextNode
      head = head?.nextNode
    }

   func removeFromTail() { // removes node from tail
      if head?.nextNode == nil {
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
    
    func toArray() -> [T] { //linkedlist to array
      var array = [T]()
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

    func append(list : LinkedList) { //appends a linkedlist
        if head?.element == nil{
            head = list.head
        }
        else{
            var testNode = head!
            while testNode.nextNode != nil {
                testNode = testNode.nextNode!
            }
            testNode.nextNode = list.head
            list.head?.prevNode = testNode
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
        return indexx //returns nil if searched element doesnt exist
    }
    
    func inserAt(index : Int,element : T ){ //inserts node at given index
        let newNode = Node(element: element)
         if head?.element == nil {
           head = newNode
        }
        else {
            if index == 0 {
                self.insertAtHead(element: element)
            }
            else {
                var testNode = head!
                for _ in 1..<index {
                    testNode = testNode.nextNode!
                }
                newNode.nextNode = testNode.nextNode
                testNode.nextNode?.prevNode = newNode
                newNode.prevNode = testNode
                testNode.nextNode = newNode
              }
        }
    }
    
    func removeFrom(index : Int) { //removes a node from given index
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
                testNode.nextNode?.nextNode?.prevNode = testNode
            }
        }
     }
            
            func searchForAll(element : T) -> [Int] { //searches  for elements and return all index as array
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

