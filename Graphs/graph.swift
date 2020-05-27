//  Graphs
//  Created by Mohit
//  Copyright © 2020 Mohit. All rights reserved.

import Foundation

class ADJlist{
    public var dict : [Int : [Int]] = [:]
}


class Graph {
    var adj : [Int : [Int]] = [:]
    
    
    func addEdge( firstVertex : Int, secondVertex : Int ){
        addedge(firstVertex , secondVertex)
    }

    private func addedge(_ firstVertex : Int, _ secondVertex : Int){
        if adj[firstVertex] == nil {
            adj[firstVertex] = []
        }
        if adj[secondVertex] == nil {
            adj[secondVertex] = []
        }
       adj[firstVertex]?.append(secondVertex)
       adj[secondVertex]?.append(firstVertex)
        
       adj.keys.sorted()  // ??
    }
    
    func removeEdge( firstVertex : Int, secondVertex : Int ){
        if adj[firstVertex] == nil || adj[secondVertex] == nil {
        }
        else{
            if (adj[firstVertex]?.contains(secondVertex))! {
                adj[firstVertex] = adj[firstVertex]?.filter {$0 != secondVertex}

                adj[secondVertex] = adj[secondVertex]?.filter {$0 != firstVertex}
            }
        }
    }
    
    func neighborsOf( vertex : Int ) -> [Int]{
        return adj[vertex]!
    }
    
    func verticesAreAdjacent( firstVertex : Int, secondVertex : Int ) -> Bool{
        if (adj[firstVertex]?.contains(secondVertex))! {
            return true
        }
        else {
            return false
        }
    }
    
    func verticesAreConnected(firstVertex : Int, secondVertex : Int) -> Bool{
        if self.verticesAreAdjacent(firstVertex: firstVertex, secondVertex: secondVertex) {
            return true
        }
        else{
            
        }
        return false
        
        
    }
    
    
    
 
    
    
    
    
    
    
    
    
    
}
