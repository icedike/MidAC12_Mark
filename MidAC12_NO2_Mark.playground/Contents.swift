//: Playground - noun: a place where people can play

import UIKit

func sortArray(array1:[Int], array2:[Int] ) -> [Int]{
    var resultArray = [Int]()
    let tempArray = array1 + array2
    //remove duplicate items
    for number in tempArray{
        if !resultArray.contains(number){
            resultArray.append(number)
        }
    }
    //sort array
    for i in 0 ..< resultArray.count-2{
        for j in 0 ..< resultArray.count-1-i {
            if resultArray[j] > resultArray[j+1] {
                let temp = resultArray[j]
                resultArray[j] = resultArray[j+1]
                resultArray[j+1] = temp
            }
        }
    }
    
    return resultArray
}


sortArray(array1: [5,7,3,5,9,1,0,7,3], array2: [2,3,3,6,10,5,4,7,10])
sortArray(array1: [1,1,1,1,1], array2: [2,2,2,2])
sortArray(array1: [1,2,1,2,1,2], array2: [3,4,3,4,3,4])
