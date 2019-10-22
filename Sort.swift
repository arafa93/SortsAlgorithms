// MARK: Mohamed Arafa

import UIKit

private var unOrderdArray : [Int] = [5,6,1,0,9,4]

//Bubble Sort
func bubbleSort(_ array : [Int]) -> [Int]{
    
    var unOrderdArr : [Int] = []
    unOrderdArr = array
    
    guard unOrderdArr.count >= 2 else{
        fatalError("1 element array")
    }
    
    for end in (1..<array.count).reversed(){
        
        var swapped = false
        
        for current in 0..<end{
            if unOrderdArr[current] > unOrderdArr[current + 1]{
                unOrderdArr.swapAt(current, current + 1)
                swapped = true
            }
        }
        
        if !swapped{
            return unOrderdArr
        }
        
    }
    return unOrderdArr
    
}


var x = bubbleSort(unOrderdArray)

//print(x)

//Selection Sort
func selectionSort(_ array : [Int]) -> [Int]{
    
    var unOrderdArr : [Int] = []
    unOrderdArr = array
    
    guard unOrderdArr.count >= 2 else{
        fatalError("1 element array")
    }
    
    for current in 0..<(unOrderdArr.count - 1){
        var lowest = current
        
        for other in (current + 1)..<unOrderdArr.count{
            if unOrderdArr[lowest] > array[other]{
                lowest = other
            }
        }
        if lowest != current{
            unOrderdArr.swapAt(lowest, current)
        }
    }
    
    return unOrderdArr
}

var y = selectionSort(unOrderdArray)

//print(y)


//Insertion Sort
func insertionSort(_ array : [Int]) -> [Int]{
    
    var unOrderdArr : [Int] = []
    unOrderdArr = array
    
    guard unOrderdArr.count >= 2 else{
        fatalError("1 element array")
    }
    
    for current in 1..<unOrderdArr.count{
        for shifting in (1...current).reversed(){
            if unOrderdArr[shifting] < unOrderdArr[shifting - 1]{
                unOrderdArr.swapAt(shifting, shifting - 1)
            }else{
                break
            }
        }
    }
    
    return unOrderdArr
}

var z = insertionSort(unOrderdArray)

//print(z)

//Merge Sort -> Divide and conquer Sort
func mergeSort(_ array : [Int]) -> [Int]{
    
    var unOrderdArr : [Int] = []
    unOrderdArr = array
    
    guard unOrderdArr.count > 1 else{
        return unOrderdArr
    }
    
    let middle = unOrderdArr.count / 2
    //recurjun
    let left = mergeSort(Array(unOrderdArr[..<middle]))
    let right = mergeSort(Array(unOrderdArr[middle...]))
    //print(unOrderdArray)
    
    return merge(left, right)
}

func merge(_ left: [Int] ,_ right: [Int]) -> [Int]{
    
    var leftIndex = 0
    var rightIndex = 0
    var result: [Int] = []
    
    while leftIndex < left.count && rightIndex < right.count{
        
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        if leftElement < rightElement{
            result.append(leftElement)
            leftIndex += 1
        }else if leftElement > rightElement{
            result.append(rightElement)
            rightIndex += 1
        }else{
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
        
    }
    
    if leftIndex < left.count{
        result.append(contentsOf: left[leftIndex...])
    }
    
    if rightIndex < right.count{
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}

var m = mergeSort(unOrderdArray)

print(m)
