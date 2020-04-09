//
//  main.swift
//  Binary Search Tree
//
//  Created by Mohit on 4/7/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import Foundation


let a = BinarySearchTree<String>()
a.insert(element: "mlmlmlm")
a.insert(element: "aa")
a.insert(element: "zzz")
a.insert(element: "pppp")
print(a.height)
print(a.size)
print(a.isEmpty)
print(a.elements)
print(a.search(element: "aa"))
print(a.contains(element: "aa"))
print(a.makeBreadthFirstArray())

a.delete(element: "zzz")
print(a.height)
print(a.size)
print(a.isEmpty)
print(a.elements)
print(a.search(element: "aa"))
print(a.contains(element: "aa"))
print(a.makeBreadthFirstArray())
