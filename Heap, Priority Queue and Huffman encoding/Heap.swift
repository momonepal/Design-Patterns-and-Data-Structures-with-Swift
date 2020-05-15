//  Heap.swift
//  Copyright © 2020 Mohit. All rights reserved.

import Foundation

class Heap<T : Comparable>{
    var array : [T] = []
    
    func insert(element : T){
        array.append(element)
        bubbleup(array.count-1)
    }
    
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    private func bubbleup(_ index: Int){
        if array[index] < array[getParentIndex(index)] {
            array.swapAt( index,getParentIndex(index))
            let newindex = getParentIndex(index)
        bubbleup(newindex)
        }
    }
    
    func extractMin() -> T?{
        if array.isEmpty{
            return nil
        }
        else{
        array.swapAt( 0, array.count-1)
        let min = array.removeLast()
        bubbledown(0)
            return min
        }
    }
    
    private func bubbledown(_ index : Int){
        if getLeftChildIndex(index) < array.count  && getRightChildIndex(index) < array.count{
            let smaller = min(array[getLeftChildIndex(index)], array[getRightChildIndex(index)])
            let smallidx = array.firstIndex(of: smaller)
            if array[index] > smaller {
                array.swapAt( index, smallidx!)
                bubbledown(smallidx!)
            }
        }else if getLeftChildIndex(index) < array.count {
                if array[index] > array[getLeftChildIndex(index)] {
                    array.swapAt( index, getLeftChildIndex(index))
                bubbledown(getLeftChildIndex(index))
            }
        }
    }
    
    var isEmpty : Bool{
        return array.count == 0
    }
    
    
}
