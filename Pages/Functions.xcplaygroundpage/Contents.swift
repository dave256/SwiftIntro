//: [Previous](@previous)

import Foundation

//: ## Functions

//: functions with no parameters
func greet() {
    print("hello world")
}
greet()


//: function with one parameter
//: parameters are part of function signature so ok to have function with same name but additional parameters
func greet(person: String) {
    print("hello \(person)")
}
greet(person: "Dave")

//: functions that return a value
func sqr(_ x: Double) -> Double {
    return x * x
}
print(sqr(3))

//: functions that return multiple values
func minMax(_ items: [Double]) -> (Double, Double) {
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

// can unpack the tuple when calling
let (smallest, largest) = minMax([3.5, -4.0, 3, 1]) // or could use var
print(smallest, largest)

// or just get a tuple back
let extremes = minMax([3.5, -4.0, 3, 1])
print(extremes.0, extremes.1)


//: functions with multiple parameters and default values
func join(string: String, toString: String, joiner: String=",") -> String {
    return string + joiner + toString
}

//: default is all parameters are named
print(join(string: "hello", toString: "world", joiner: " "))
print(join(string: "hello", toString: "world"))


//: if want to pass all as names, specify external name for first parameter
func join2(string: String, toString: String, joiner: String) -> String {
    return string + joiner + toString
}
print(join2(string: "hello", toString: "world", joiner: ","))

//: can give a different external name for parameters, but default is same as internal name
func join3(firstString string: String, secondString toString: String, joiner: String) -> String {
    return string + joiner + toString
}
print(join3(firstString: "hello", secondString: "world", joiner: ","))

//: can remove named parameters with underscore
func join4(_ string: String, _ toString: String, joiner: String) -> String {
    return string + joiner + toString
}
print(join4("hello", "world", joiner: ","))

//: pass by reference
//: use inout modifier on parameters passed by reference
func swap( a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

//: must call with ampersand (for readability so can tell by looking at call that parameter(s) are passed by reference)
var c = 5
var d = 6
swap(&c, &d)
print(c, d)

//: generics (similar to templates in C++ but much nicer syntax!)
//: in this example T is the generic type
func swap2<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var e = 3.5
var f = 4.5
swap2(&e, &f)
swap2(&c, &d)

print(c, d, e, f)


//: [Next](@next)

