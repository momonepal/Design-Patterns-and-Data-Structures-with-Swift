import Foundation

class Node{
  var element : Int
  var nextNode : Node?
  //var tailNode : Node?

  init(element : Int) {
    self.element = element
  }
}

class LinkedList {
  var head : Node?
    
  var tail : Node? {
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

    func insert(element : Int) {
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
  
  var firstElement : Int? {
    get {
      return head?.element
    }
  }

  var lastElement : Int? {//using tail pointer
    get {
      return tail?.element
    }
  }

  var lastElement2 : Int? { //using only head  pointer
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

  func insertAtHead(element : Int) {
       let newNode = Node(element: element)
       if head?.element == nil {
         head = newNode
        }
       else {
        newNode.nextNode = head
         head = newNode
       }
    }

  func insertAtTail(element : Int) {
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
    
    func toArray() -> [Int] {
      var array = [Int]()
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

    func search(element : Int) -> Int? { //returns index counting from 0
        var counter = 1
        var indexx : Int? = nil
        var testNode = head
        if testNode?.element == element {
            indexx = 0            
        }
        while testNode?.nextNode != nil {
            testNode = testNode?.nextNode!
            if testNode?.element == element {
                let indexx = counter
                return indexx
            }
            
            counter += 1
        }
        return indexx //returns nil if searched elemnt doesnt exist
    }
    
    func inserAt(index : Int,element : Int ){
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
            
            func searchForAll(element : Int) -> [Int] {
                var counter = [Int]()
                var index = 0
                var testNode = head
                while testNode?.nextNode != nil {
                    if testNode?.element == element {
                        counter.append(index)
                    }
                    index += 1
                    testNode = testNode?.nextNode!
                }
                if testNode?.element == element {
                counter.append(index)
                }
                return counter
            }
            
        
        
        
        
}
        
    
    





