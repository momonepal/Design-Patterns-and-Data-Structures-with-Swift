
import Foundation




import Foundation
enum NodeColor {
    case  red, black
}

class RBNode<T : Comparable>{
  var element : T
  var leftChild : RBNode<T>?
  var rightChild : RBNode<T>?
  var color = NodeColor.black
    
  init(element : T) {
    self.element = element
  }
    
    
  func insert(node: RBNode<T>) {
        if self.element > node.element {
            if let leftChild = self.leftChild {
               leftChild.insert(node: node)
            } else {
                self.leftChild = node
            }
        } else {
            if let rightChild = self.rightChild {
               rightChild.insert(node: node)
            } else {
                self.rightChild = node
            }
        }
    }
  
    func colorch(_ node : RBNode<T>) {
        if node.color == .red{
            print("red")
        }
        else{
            print("black")
        }
    }
    
  var height : Int {
    let leftHeight = self.leftChild?.height ?? 0
    let rightHeight = self.rightChild?.height ?? 0
        return max(leftHeight, rightHeight) + 1
    }
    
  var inorder : [T]{
    var array: [T] = []
    if self.leftChild != nil{
         array += self.leftChild!.inorder
    }
    array.append(self.element)
    if self.rightChild != nil{
        array += self.rightChild!.inorder
    }
    return array
  }
    
  func rotateLeft() {
    if self.rightChild != nil {
        let newNode = RBNode(element: self.element)
        newNode.leftChild = self.leftChild
        newNode.rightChild = self.rightChild?.leftChild
        self.element = self.rightChild!.element
        self.rightChild = self.rightChild?.rightChild
        self.leftChild = newNode
        self.leftChild?.color = .red
    }
 
      }
  
    
  func rotateRight() {
    if self.leftChild != nil {
        let newNode = RBNode(element: self.element)
        newNode.leftChild = self.leftChild?.rightChild
        newNode.rightChild = self.rightChild
        self.element = self.leftChild!.element
        self.leftChild = self.leftChild?.leftChild
        self.rightChild = newNode
        self.rightChild?.color = .red
     }
  }
    

    

  func colorFlip() {
    self.color = .red
    self.rightChild?.color = .black
    self.leftChild?.color = .black
   }
    
    func balanceTree() {
        if self.rightChild?.color == .red && self.leftChild?.color != .red{
            self.rotateLeft()
        }
        if self.leftChild?.color == .red && self.leftChild?.leftChild?.color == .red {
            self.rotateRight()
        }
        
        if self.rightChild?.color == .red && self.leftChild?.color == .red{
            self.colorFlip()
        }
        self.leftChild?.balanceTree()
        self.rightChild?.balanceTree()
    }

    
   
    
    
}


class RedBlackTree<T : Comparable>{
    var root : RBNode<T>?
    
    
    //gives height of the tree, with root included
    var height : Int {
        guard !self.isEmpty else {
            return 0
        }
        return self.root!.height
    }
    
    //Checks if the tree is empty
    var isEmpty : Bool {
        return self.root == nil
    }
    
    //gives the total nodes/elemnts of RBT
    var size : Int {
        guard !self.isEmpty else {
            return 0
        }
        return self.root!.inorder.count
    }

    //returns elements in order
    var elements : [T] {
        guard !self.isEmpty else {
            return []
        }
        return self.root!.inorder
    }

    init( fromSortedData : [T] = [] )  {
        for element in fromSortedData {
            self.insert(element: element)
        }
    }
    //inserts element to the RBT
    func insert(element: T) {
        let node = RBNode(element: element)
        node.color = .red
            if let root = self.root{
                self.root!.insert(node: node)
            } else {
                self.root = node
                self.root!.color = .black
            }
        self.root?.balanceTree()
    }
    
    
    
    //searches for element in RBT and returns it
    func search( element : T ) -> T?{
        return self.search(self.root, element)
        }
        
        private func search(_ rootnode: RBNode<T>?, _ element: T) -> T?{
            guard let test = rootnode else {
                return nil
            }
            if element > test.element {
                return self.search(test.rightChild, element)
            } else if element < test.element {
                return self.search(test.leftChild, element)
            } else {
                return test.element
            }
        }
    
    //checks if the RBT contains the element and returns Bool
    func contains( element : T ) -> Bool{
        if self.search(self.root, element) == element{
            return true
        }else{
            return false
        }
    }
    
    //return a array of traversal Breadth First, Top to bottom, left to right
    func makeBreadthFirstArray() -> [T]{
        var array : [T] = []
        var queue : [RBNode<T>] = []
        var node = self.root
        if self.isEmpty == false {
        while node != nil {
            array.append(node!.element)
            if node?.leftChild != nil{
                queue.append(node!.leftChild!)
            }
            if node?.rightChild != nil{
                queue.append(node!.rightChild!)
            }
            if !queue.isEmpty{
                node = queue.removeFirst()
            }else{
                node = nil
            }
        }
        }
        return array
    }
    
    //delete an element/node from RBT
    func delete( element : T ){
        var array = self.makeBreadthFirstArray()
        let index = array.firstIndex(of: element)
        if index != nil{
            array.remove(at: index! )
        }
        let BST = RedBlackTree()
        for n in array{
            BST.insert(element: n)
        }
        self.root = BST.root
    }


}
