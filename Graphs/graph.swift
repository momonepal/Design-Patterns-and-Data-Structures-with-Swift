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
        if adj[vertex] != nil{
            return adj[vertex]!
        }
        else {
            return []
        }
    }
    
    func verticesAreAdjacent( firstVertex : Int, secondVertex : Int ) -> Bool{
        if adj[firstVertex] != nil{
            if (adj[firstVertex]?.contains(secondVertex))! {
                return true
            }
            else {
                return false
            }
        }
        return false
    }
    
    func verticesAreConnected(firstVertex : Int, secondVertex : Int) -> Bool{
        if self.verticesAreAdjacent(firstVertex: firstVertex, secondVertex: secondVertex) {
            return true
        }
        else{
            return BFS(firstVertex: firstVertex, secondVertex: secondVertex) != nil
        }
    }
    
    private func BFS(firstVertex : Int, secondVertex : Int )  -> [Int]?{
        var prevVerts : [Int:Int?] = [firstVertex : nil]
        var queue = [firstVertex]
        
        while !queue.isEmpty {
            let currentVertex = queue.removeLast()
            
            for a in adj[currentVertex] ?? [] {
                if !(prevVerts.keys.contains(a)) {
                    queue.append(a)
                    prevVerts[a] = currentVertex
                }
                if a == secondVertex {
                    var shortestPath = [a]
                    while true {
                        if let prevVert = prevVerts[shortestPath.last!] ?? nil {
                            shortestPath.append(prevVert)
                        } else {
                            return shortestPath.reversed()
                        }
                    }
                }
            }
        }
        return nil
    }
    
    func shortestPathFrom(_ start : Int, to end : Int ) -> [Int]?{
        return BFS(firstVertex: start, secondVertex: end)
    }
    
    
    func hasCycle() -> Bool {
        var visited: [Int:Bool] = [:]
        for x in adj.keys {
            visited[x] = false
        }
        for x in adj.keys {
            if visited[x] == false {
                if hasCycleR(v: x, parent: x, visited: &visited) {
                    return true
                }
            }
        }
        return false
    }
    
    private func hasCycleR(v: Int, parent: Int, visited: inout [Int:Bool]) -> Bool {
        visited[v] = true
        for x in adj[v] ?? [] {
            if visited[x] == false {
                if hasCycleR(v: x, parent: v, visited: &visited) {
                    return true
                }
            }
            else if visited[x] == true && x != parent {
                return true
            }
        }
        return false
    }
    
    
    
}



















