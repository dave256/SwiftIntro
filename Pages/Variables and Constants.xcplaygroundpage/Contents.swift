//: [Previous](@previous)

//: ## Variables and Constants
import Foundation

//: ### Constants are defined with let
// creates constant i of type Int
let i: Int = 3

// creates constant j of type Int (implicit type determination)
let j = 4

// re-assigning a constant is an error
// i = 4 // this would be an error

//: ### Variables are defined with var
var x = 3.5 // creates variable x of type Double (implicity type determination)
var y: Float = 4 // creates variable y of type Float

x = Double(y) // need cast since not same type
y = Float(x) // need cast since not same type

//: ### Optionals
//: Optionals may be nil. All non-optionals must have a valid value for the type.
//: Optionals are declared as a type with a ? following the type

var k: Int? // k is an Optional Int with the value nil
var k1: Int? = 10 // k1 is an Optional Int with the value 10
// var k2 = k1 + 1 // this is invalid since k1 is an optional

//: if you know an optional does not have a nil value, can use ! after variable name to get the value
//: but that will crash if the constant/variable is nil
// var k2 = k! + 1 // this would crash since k is nil
var k2 = k1! + 1 // this is valid since k1 is not nil and k2 is now 11

//: often use if let syntax to
if let k3 = k1 { // only true if k1 is not nil and assigns k3 to be the value of k1
    print(k3)
}

//: ## Print
//: similar to Python, print
// default value for separator is a space and default value for terminator is a new line
//: print( <comma separated expressions>, separator=" ", terminator="\n")

print("hello world") // hello world
print("hello", "world") // hello world
// notice that you put a
print("hello", "world", separator: "") // helloworld

print("hello", terminator: " ")
print("world") // this and above produce hello world

// print() // unlike Python, print by itself is an error
print("") // this will move down to next line as print() would in Python

// \(varName) string interpolation for printing out
print("x = \(x)") // x = 4.0

//: [Next](@next)

