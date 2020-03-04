import Foundation

class Node{
  var element : Int
  var nextNode : Node?
  var tailNode : Node?

  init(element : Int) {
    self.element = element
  }
}

class LinkedList {
  var head : Node?
  var tail : Node?

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
    }
    }
    
    func printLinkedList(){
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

  var lastElement : Int? {
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
      if head?.element == nil {
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


}



