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
    }
    
}
