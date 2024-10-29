import UIKit

//MARK: Question 5, Four Passengers and a Driver

/*
 A typical car can hold four passengers and one driver, allowing five people to travel around. Given n number of people, return how many cars are needed to seat everyone comfortably.

 carsNeeded(5) ➞ 1

 carsNeeded(11) ➞ 3

 carsNeeded(0) ➞ 0
 
 Borrowed from: edabit.com
 */

// Function to calculate how many cars are needed
func carsNeeded(_ people: Int) -> Int {
    let capacityPerCar = 5 // 4 passengers + 1 driver
    return (people + capacityPerCar - 1) / capacityPerCar // Using ceiling division logic
}

// Calling the function
let numberOfCars1 = carsNeeded(5)
print(numberOfCars1) // Output: 1

let numberOfCars2 = carsNeeded(11)
print(numberOfCars2) // Output: 3

let numberOfCars3 = carsNeeded(0)
print(numberOfCars3) // Output: 0
