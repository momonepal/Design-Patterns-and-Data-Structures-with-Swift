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
}


class BinarySearchTree<T : Comparable>{
    var root : BSTNode<T>?
    
    init(){} // make an empty tree
    
    func insert(element: T) {
        let node = BSTNode(element: element)
            if let root = self.root{
                self.insertt(root, node)
            } else {
                self.root = node
            }
        }
    func insertt(_ root: BSTNode<T>, _ node: BSTNode<T>) {
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
    
    
    func contains( element : T ) -> Bool{
        if self.search(self.root, element) == element{
            return true
        }else{
            return false
        }
    }
        




}
