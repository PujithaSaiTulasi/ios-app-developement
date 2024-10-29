import UIKit

//MARK: Question 2, Sort and Array by String length

/* Create a function that takes an array of strings and return an array, sorted from shortest to longest.
 
 sortByLength(["Google", "Apple", "Microsoft"])
 ➞ ["Apple", "Google", "Microsoft"]

 sortByLength(["Leonardo", "Michelangelo", "Raphael", "Donatello"])
 ➞ ["Raphael", "Leonardo", "Donatello", "Michelangelo"]

 sortByLength(["Turing", "Einstein", "Jung"])
 ➞ ["Jung", "Turing", "Einstein"]
 
 Borrowed from: edabit.com
 */

// Function to sort an array of strings from shortest to longest
func sortByLength(_ array: [String]) -> [String] {
    return array.sorted { $0.count < $1.count }
}

// Calling the function
let sortedArray1 = sortByLength(["Google", "Apple", "Microsoft"])
print(sortedArray1) // Output: ["Apple", "Google", "Microsoft"]

let sortedArray2 = sortByLength(["Leonardo", "Michelangelo", "Raphael", "Donatello"])
print(sortedArray2) // Output: ["Raphael", "Leonardo", "Donatello", "Michelangelo"]

let sortedArray3 = sortByLength(["Turing", "Einstein", "Jung"])
print(sortedArray3) // Output: ["Jung", "Turing", "Einstein"]
