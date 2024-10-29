import UIKit

//MARK: Question 1, Concatenating Two Integers

/* Create a function to concatenate two integer arrays.
 concatenate([1, 3, 5], [2, 6, 8]) ➞ [1, 3, 5, 2, 6, 8]

 concatenate([7, 8], [10, 9, 1, 1, 2]) ➞ [7, 8, 10, 9, 1, 1, 2]

 concatenate([4, 5, 1], [3, 3, 3, 3, 3]) ➞ [4, 5, 1, 3, 3, 3, 3, 3]
 
 Do not forget to return the resulting array.
 
 Borrowed from: edabit.com
 */

// Function to concatenate two integer arrays
func concatenate(array1: [Int], array2: [Int]) -> [Int] {
    return array1 + array2
}

// Calling the function
let concatenatedArray1 = concatenate(array1: [1, 3, 5], array2: [2, 6, 8])
print(concatenatedArray1) // Output: [1, 3, 5, 2, 6, 8]

let concatenatedArray2 = concatenate(array1: [7, 8], array2: [10, 9, 1, 1, 2])
print(concatenatedArray2) // Output: [7, 8, 10, 9, 1, 1, 2]

let concatenatedArray3 = concatenate(array1: [4, 5, 1], array2: [3, 3, 3, 3, 3])
print(concatenatedArray3) // Output: [4, 5, 1, 3, 3, 3, 3, 3]





