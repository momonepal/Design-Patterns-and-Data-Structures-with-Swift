//  Sorting
//  Created by Mohit
//  Copyright © 2020 Mohit. All rights reserved.

import Foundation
extension Array where Element: Comparable {
    func BubbleSort() -> Array{
        var array = self
        for _ in array{
            var swapped = false
            for index in 1..<array.count{
                if array[index-1] > array[index] {
                    array.swapAt( index,index-1)
                    swapped = true
                }
            }
            if swapped == false{
                break
            }
        }
        return array
    }
    
    func InsertionSort() -> Array {
        var array = self
        for index in 1..<array.count{
            let temp = array[index]
            var position = index
            while position > 0 &&  array[position-1]>temp {
                array[position] = array[position-1]
                position -= 1
            }
            array[position] = temp
        }
        return array
    }
    
    func SelectionSort() -> Array {
        var array = self
        for idx in 0..<array.count{
            var lowindex = idx
            for index in idx+1..<array.count{
                if array[index] < array[lowindex] {
                    lowindex = index
                }
            }
            array.swapAt(lowindex, idx)
        }
        return array
    }
    
    
}
