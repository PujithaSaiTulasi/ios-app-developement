import UIKit

//MARK: Question 6, Divide and conquer
/*
 First, create a function that returns the number of times an integer can be divided by another integer without a remainder. The function should return nil if the division doesn’t produce a whole number. Name the function divideIfWhole.

 Then, write code that tries to unwrap the optional result of the function. There should be two cases: upon success, print "Yep, it divides \(answer) times", and upon failure, print "Not divisible :[".

 Finally, test your function:
 
 Call divideIfWhole(10, by: 2) -> 5. Since, the returned value is not nil, print: "Yep, it divides 5 times."
 divideIfWhole(10, by: 3) -> nil. Since, the returned value is nil, print: "Not divisible :[."
 
 
 
 borrowed from: https://www.kodeco.com/
 */

// Function to return the number of times an integer can be divided by another without a remainder
func divideIfWhole(_ dividend: Int, by divisor: Int) -> Int? {
    if dividend % divisor == 0 {
        return dividend / divisor
    } else {
        return nil
    }
}

// Function to test and print result
func testDivision(_ dividend: Int, by divisor: Int) {
    if let result = divideIfWhole(dividend, by: divisor) {
        print("Yep, it divides \(result) times.")
    } else {
        print("Not divisible :[")
    }
}

// Testing the function
testDivision(10, by: 2) // Output: Yep, it divides 5 times.
testDivision(10, by: 3) // Output: Not divisible :[
