//: [Previous](@previous)

import Foundation

//: ## Data Types
//: Note all built-in data types are value types including arrays and dictionaries

//: ## Int
//:   * Int
//:   * Int8 - 8-bit integer
//:   * Int16 - 16-bit integer
//:   * Int32 - 32-bit integer
//:   * Int64 - 64-bit integer

//: ## UInt
//:   * UInt
//:   * UInt8 - unsigned 8 bit integer
//:   * UInt16 - unsigned 16-bit integer
//:   * UInt32 - unsigned 32-bit integer
//:   * UInt64 - unsigned 64-bit integer

//: ## Float
//:   * Float
//:   * Double
//:   * Float64
//:   * Float80

//: ## Bool
let t: Bool = true
let f: Bool = false

//: ## String
var greeting = "hello" // must use double quotes, not either double or single like Python


//: count property gives you length of the string
print(greeting.count)

//: iterate over characters in string
for ch in greeting {
    print(ch, terminator: " ")
}
print("")
var index = greeting.startIndex

print(greeting[index])
index = greeting.index(after: index)
print(greeting[index])
index = greeting.index(index, offsetBy: 2)
print(greeting[index])

//: String formatting
//: must import Foundaton for this to work
let i = 42
let pi = 3.14159
let formatted = String(format: "i=%3d pi=%0.3f", i, pi)
print(formatted)


//: ## Array

//: delcaring empty arrays
var empty1 = [Int]()
var empty2: [Int] = []

// declaring and initializing array
var items1 = [1, 2, 3] // or var items1: Int = [1, 2, 3]

//: common properties/methods (there are many more)
items1.count // # of elements in array
items1.isEmpty // Bool
items1.append(4)

// note that all parameters except first are specified with paramemeter name by default
items1.insert(0, at: 0)
items1.removeFirst() // removes and returns first element
items1.removeLast() // removes and returns last element
// empty1.removeLast() // this would throw an exception

// indices returns sequence of the array indices
for i in items1.indices {
    print(i, items1[i])
}
print("")

// enumerated method works like enumerate in Python
for (i, item) in items1.enumerated() {
    print(i, item)
}

for x in items1 {
    print(x)
}

//: ## Tuple
//: similar to Python tuples but typed and var/let specify mutable/immutable

var intStringTuple = (3, "abc")
// this would cause an error due to strong typing
// intStringTuple = (3, 4)

// access tuple elments using . followed by position
print("\(intStringTuple.0) \(intStringTuple.1)")
intStringTuple.0 = 5
intStringTuple.1 = "def"
print("\(intStringTuple.0) \(intStringTuple.1)")

// can explicitly declare with types
var intStringTuple2: (Int, String) = (4, "def")


//: ## Dictionary
//: hash tables
//: keys must conform to Hashable protocol
// dictionary mapping String to Int
var dictionary = [String:Int]()
dictionary["abc"] = 3
dictionary["def"] = 4

// note, lookup returns an optional in case key is not in the dictionary
for k in dictionary.keys {
    print("\(k) \(String(describing: dictionary[k])) \(dictionary[k]!)")
}

//: ## Sets
//: elements must conform to Hashable protocol; efficient for checking membership; similar to a dictionary with just keys, but no values; no implied order to elements
var s: Set<Int> = [1, 2, 3]
s.insert(5)
s.insert(0)
for x in s {
    print(x)
}
print(s.contains(3))
print(s.contains(6))

//: ## Value Types
var a1 = [1, 2, 3]
var a2 = a1
a1.append(4)
print(a1)

//: what will this print if we uncomment it?
// print(a2)


//: [Next](@next)

