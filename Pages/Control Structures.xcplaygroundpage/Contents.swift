//: [Previous](@previous)

import Foundation

//: ## Control Structures
//: must use {} to mark blocks for all control structures
//: note: ++ and -- operators are being removed in Swift 3.0 so use += 1 and -= 1
//: do not need to put () around boolean expressions in while, repeat, if
//: also has C/C++ style for loop for (i=0; i<10; i+=1) but prefer for-each style
//: believe C/C++ style for loop is going away in Swift 3.0
//: ### for loops

// open interval (does not include 5)
for i in 0..<5 {
    print("hi \(i)")
}

print("")
// closed interval (does include 5)
for i in 1...5 {
    print("hi \(i)")
}
print("")

// can filter with where clause
for i in 0..<10 where i % 2 == 0 {
    print(i)
}
print("")

// for each loop
let items = [1, 2, 3]
for x in items {
    print(x)
}
print("")

//: ### while loop (precondition loop)
var i = 0
while i < 5 {
    print(i)
    i += 1
}
print("")

//: ### repeat loop (postcondition loop)

i = 0
repeat {
    print(i)
    i += 1
} while i < 5
print("")

//: ### if statement
//: use && and || and ! (cannot use "and", "or", or "not")
var x = 3, y = 4
if x > y || i > 0 {
    print("if")
} else {
    print("else")
}
print("")

if !(x == y || i > 0) {
    print("if")
} else {
    print("else")
}
print("")

let grade = 77.5
if (grade >= 90) {
    print("A")
} else if grade >= 80 {
    print("B")
} else if grade >= 70 {
    print("C")
} else if (grade >= 60) {
    print("D")
} else {
    print("F")
}

//: ### break and continue
var sum = 0
for i in 0..<10 {
    sum += i
    if sum > 10 {
        // break out of loop
        break
    }
}
print(sum)
print("")

sum = 0
for i in 0..<10 {
    if i % 2 == 1 {
        // start loop over at next loop iteration (skip remaining body of loop for this iteration)
        continue
    }
    sum += i
}
print(sum)
print("")

//: ### guard statement
//: useful for early return in a function if precondition is not met or if an optional parameter is nil
//:
//: guard statement must exit the scope that the guard statement is in with return, break, continue, throws

func minMax(values: [Double]?) -> (Double, Double)? {

    // assign items to values if values not nil and then continue if items.count > 0
    // otherwise it returns nil
    guard let items = values, items.count > 0 else {
        return nil
    }

    var min = items[0]
    var max = items[0]
    for i in 1..<items.count {
        if items[i] < min {
            min = items[i]
        } else if items[i] > max {
            max = items[i]
        }
    }
    // must use () in Swift when returning multiple values
    return (min, max)
}

if let (min, max) = minMax(values: nil) {
    print(min, max)
}
if let (min, max) = minMax(values: []) {
    print(min, max)
}
if let (min, max) = minMax(values: [3, -1, 4]) {
    print(min, max)
}

//: ### defer statement
//: used to add a block of code that will be executed before function execution ends
//: useful when using with exception handling or have early return statements
//:
//: or other practical example is if you open a file, put the close in defer block immediately afterwards
//:
//: “Deferred actions are executed in reverse order of how they are specified—that is, the code in the first defer statement executes after code in the second, and so on.”
//: Excerpt From: Apple Inc. “The Swift Programming Language (Swift 2).” iBooks. https://itun.es/us/jEUH0.l
func deferExample() {

    print("hello")
    defer {
        print("any cleanup")
    }
    print("world")
    defer {
        print("first cleanup")
    }
}

deferExample() // prints "hello\nworld\nfirst cleanup\nany cleanup")

//: ### exception handling
/*:
 Some functions/methods may *throw* an error.

 “There are four ways to handle errors in Swift. You can propagate the error from a function to the code that calls that function, handle the error using a do-catch statement, handle the error as an optional value, or assert that the error will not occur.”

 Excerpt From: Apple Inc. “The Swift Programming Language (Swift 2.1).” iBooks. https://itun.es/us/jEUH0.l

 Functions/methods that may throw an error must be marked using the *throws* keyword. This includes code that calls a method that throws an error that is not handled (i.e., any potential error that is generated is not caught and thus propagated to the caller).

 So essentially, if a method is not marked *throws*, it should not fail.

 */

//: declare your own error type as an enum that conforms to ErrorType
//: optional associated value
enum MathError: Error {
    case DomainError(String)
}

func mySqrt(_ x: Double) throws -> Double {
    guard x >= 0.0 else {
        throw MathError.DomainError("domain of sqrt is non-negative numbers")
    }
    // IBM sandbox does not have sqrt so change to return 5
    // return 5
    return sqrt(x)
}

// must call a method that my throw with a try variant
// this will not compile
// let d1 = mySqrt(-5.0)

// d1 will be nil
let d1 = try? mySqrt(-25)

// d2 will be 5
let d2 = try! mySqrt(25)

// this would crash
// let d3 = try! mySqrt(-5)


func sqr(_ x: Double) -> Double {
    return x * x
}

//: this would not compile because can't be certain that mySqrt will not throw
//func distance(x1 x1: Double, y1: Double, x2: Double, y2: Double) -> Double {
//    return try mySqrt(sqr(x1 - x2) + sqr(y1 - y2))
//}

//: options are to propagate error so mark function as it may throw
func distance(x1: Double, y1: Double, x2: Double, y2: Double) throws -> Double {
    return try mySqrt(sqr(x1 - x2) + sqr(y1 - y2))
}

//: or better in this case since can be certain it will not throw an error
func distance2(x1: Double, y1: Double, x2: Double, y2: Double) -> Double {
    return try! mySqrt(sqr(x1 - x2) + sqr(y1 - y2))
}

// must call this one with try
print(try! distance(x1: 0, y1: 0, x2: 3, y2: 4))


// do not need to call this one with try since it cannot propagate the error
print(distance2(x1: 0, y1: 0, x2: 3, y2: 4))

/*: catching errors
 catch the error with do/catch block and get the associated value with the enum
 */
// do block catching any error
do {
    print(try distance(x1: 0, y1: 0, x2: 3, y2: 4))
} catch {
    print("error")
}

// do/catch block catching our specific error
do {
    let d = try mySqrt(-25)
    print(d)
} catch MathError.DomainError(let msg) {
    print(msg)
}


//var input = readLine()
//print(input)

//: [Next](@next)

