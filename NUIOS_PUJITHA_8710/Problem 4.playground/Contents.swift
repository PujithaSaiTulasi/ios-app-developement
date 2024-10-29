import UIKit

//MARK: Question 4, Remove the First and Last Characters

/*
 Create a function that removes the first and last characters from a string.
 
 removeFirstLast("hello") ➞ "ell"

 removeFirstLast("maybe") ➞ "ayb"

 removeFirstLast("benefit") ➞ "enefi"

 removeFirstLast("a") ➞ "a"
 
 Borrowed from: edabit.com
 
 HINT: remove(at: index)
 */

// Function to remove the first and last characters from a string
func removeFirstLast(_ str: String) -> String {
    if str.count <= 2 {
        return str // If the string is 2 characters or less, return it as is
    }
    
    var modifiedStr = str
    modifiedStr.remove(at: modifiedStr.startIndex) // Remove first character
    modifiedStr.remove(at: modifiedStr.index(before: modifiedStr.endIndex)) // Remove last character
    return modifiedStr
}

// Calling the function
let removedFirstAndLast1 = removeFirstLast("hello")
print(removedFirstAndLast1) // Output: "ell"

let removedFirstAndLast2 = removeFirstLast("maybe")
print(removedFirstAndLast2) // Output: "ayb"

let removedFirstAndLast3 = removeFirstLast("benefit")
print(removedFirstAndLast3) // Output: "enefi"

let removedFirstAndLast4 = removeFirstLast("a")
print(removedFirstAndLast4) // Output: "a"


