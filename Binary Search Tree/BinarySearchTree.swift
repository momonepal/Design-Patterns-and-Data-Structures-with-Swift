//  BinarySearchTree.swift
//  Binary Search Tree
//  Created by Mohit
//  Copyright © 2020 Mohit. All rights reserved

import Foundation

class BSTNode<T : Comparable>{
  var element : T
  var leftChild : BSTNode<T>?
  var rightChild : BSTNode<T>?
    
  init(element : T) {
    self.element = element
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
    
    
}


class BinarySearchTree<T : Comparable>{
    var root : BSTNode<T>?
    
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
    
    //gives the total nodes/elemnts of BST
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
    //inserts element to the BST
    func insert(element: T) {
        let node = BSTNode(element: element)
            if let root = self.root{
                self.insertt(root, node)
            } else {
                self.root = node
            }
        }
    private func insertt(_ root: BSTNode<T>, _ node: BSTNode<T>) {
                 if root.element > node.element {
                     if let leftChild = root.leftChild {
                         self.insertt(leftChild, node)
                     } else {
                         root.leftChild = node
                     }
                 } else {
                     if let rightChild = root.rightChild {
                         self.insertt(rightChild, node)
                     } else {
                         root.rightChild = node
                     }
                 }
             }
    
    //searches for element in BST and returns it
    func search( element : T ) -> T?{
        return self.search(self.root, element)
        }
        
        private func search(_ rootnode: BSTNode<T>?, _ element: T) -> T?{
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
    
    //checks if the BST contains the element and returns Bool
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
        var queue : [BSTNode<T>] = []
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
    
    //delete an element/node from BST
    func delete( element : T ){
        var array = self.makeBreadthFirstArray()
        let index = array.firstIndex(of: element)
        if index != nil{
            array.remove(at: index! )
        }
        let BST = BinarySearchTree()
        for n in array{
            BST.insert(element: n)
        }
        self.root = BST.root
    }


}
