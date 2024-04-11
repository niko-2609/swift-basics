import Foundation

let myNumber = 7
var secondNumber = 10

print(secondNumber)
var floatingValue = 10.4

let myName = "Rishabh"

// we can use different values in a string using backslash(\) and parenthesis
let summary = "I have \(myNumber + secondNumber) numbers"

let summary2 = "I have some floating value like \(floatingValue)"

let greeting = "Hello \(myName)"


let label = "Newlabel"
let width = 65

// type conversion is done by explicity creating a new instance of the desired type
 let widthLabel = label + String(width)

// values having multiple lines of strings
let quotation = """
        Even though there's whitespace to the left,
        the actual lines aren't indented.
            Except for this line.
        Double quotes (") can appear without being escaped.

        I still have \(myNumber + secondNumber) pieces of fruit.
        """


// define an array
var fruits = ["apples", "oranges",]
fruits.append("grapes")
print(fruits)



// define a dictionary
var dictionary = [
    "Rishabh" : "engineer",
    "Simran" : "advocate"
]


print(dictionary)

// add items to dictionary
dictionary["Manu"] = "team lead"

print(dictionary)



// empty array
fruits = []
print(fruits)

// empty dictionary
dictionary = [:]

print(dictionary)



let scores = [78, 91, 100, 20, 44, 29]
var teamScore = 0

// loops
// parenthesis around the conditions is optional
// braces around the body is required
for score in scores {
    // condition in if-else must be a boolean.
    // using only `if score {}` will give error.
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}


print(teamScore)

// ternary operator can be used as javascript
let celebration =  teamScore > 10 ? "🎉" :"no celebration"
print(celebration)


// optionals
var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false"


// unwrapping optional value with ! operator
var optionalString2: String? = "Hello"
print(optionalString2!)
// Prints "Hello"


// in the second case, ! operator is used to unwrap the conditional value. It lets swift know that "hey I am sure this optional has a value, can you please unwrap it.

var optionalName: String? = nil
var greetingTest = "Hello!"
if let name = optionalName {
    greetingTest = "Hello, \(name)"
} else if optionalName == nil {
    // if the optional value is nil and we want to use it in a string, we need to explicitly tell the compiler that the variable is an optional of desired type. Here we say the compiler that the optionalName should be considered as an optional String value and thus the compiler doesn't throw an error.
    greetingTest = "Hello \(optionalName as String?)"
}

print(greetingTest)



// Switch statements
let vegetable = "red pepper"
switch vegetable {
case "cellary":
    print("its a cellary")
case "cucumber", "watercress":
    print("cucumber")
case let x where x.hasSuffix("pepper"):
    print("is it a spicy \(x)")
default:
    print("no worries, fuck yourself")
}


//After executing the code inside the switch case that matched, the program exits from the switch statement. Execution doesn’t continue to the next case, so you don’t need to explicitly break out of the switch at the end of each case’s code.

// for-in loop for dictionaries
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (numberType, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            print(numberType)
        }
    }
}
print(largest)



// while loop
var n = 2
while n < 100 {
    n *= 2
}
print(n)


// while-repeat
var m = 2
repeat {
    m *= 2
} while m < 0
print(m)



// index in a loop
// ..< excludes the upper limit and only goes till 1 less the than the limit, in this case, it runs till i is 3 and exits, thus the value printed is 6
var total = 0
for i in 0..<4 {
    total += i
}
print(total)


// ...includes both upper and lower value
var total2 = 0
for i in 0...4 {
    total2 += i
}
print(total2)



// functions
// _ is used for arguments that dont want any labels to be given when called.
// Custom labels can be put before the argument name and when calling the function, we can use this label instead of passing the actual argument name like shown below.
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}


greet("Simran", on: "thursday")


// we can use tuples to return multiple values from a function.
// we can refer to return values using number or the name of the value

func calculateStatistics(_ values: [Int]) -> (min: Int, max: Int, sum: Int) {
    var max = values[0]
    var min = values[0]
    var sum = 0
    
    for value in values {
        if value < min {
            min = value
        } else if value > max {
            max = value
        }
        sum += value
    }
    
    return( min, max, sum)
}

let statistics = calculateStatistics([4,7,2,1,8,9,10])

// accessing the return value from tuple using the name
print(statistics.min)

// accessing return value from tuple using its position in the tuple.
print(statistics.0)




// nested functions

func nestingExample(_ value: Int) -> Int {
    var min = value
    func add() {
        min += 5
    }
    add()
    return min
}

let result = nestingExample(4)
print(result)



// functions are first-class types, i.e functions can return other functions.


func returningFunction() -> ((String) -> String) {
    func nameFunction(_ name: String) -> String {
        return "Hello \(name)"
    }
    return nameFunction
 }


// Here we get the function returned by the parent function by just calling the parent function.
var namingFunctionReturned = returningFunction()

// Once we have the actual returned function, we can call the function using the arguments.
namingFunctionReturned("Rishabh")


// Functions can also accept other functions as arguments

// Parent function that takes another function as argument
func argumentAcceptingFunction(list: [Int], acceptedFunction: (Int) -> Bool) -> Bool? {
    for item in list {
        if acceptedFunction(item) {
            return true
        }
    }
    return false
}


// Function that is passed as the argument
//func lessThanTen(_ num: Int) -> Bool {
//   return num < 10
//}


// Calling the actual function that takes another function as argument

var list = [11,10,14,20,11,17,11]
let resultingValue = argumentAcceptingFunction(list: list, acceptedFunction: {(num:Int) -> Bool in
    return num < 10
})


print(resultingValue!)


// We can write functions without a name using braces {}.
// For this nameless function, to seperate the function definition and the body, we use 'in' keyword
var newList = list.map({(value:Int) -> Int in
    return value % 2 == 0 ? 1 : 0
})

print(newList)

// We can omit the argument type and return type when we know the type of closure. Here since list is an array of integers and map iterates over each element, compiler understands that it will get an integer and has to return an integer

let mappedNumbers = list.map({ listItem in "rishabh" })
print(mappedNumbers)

// we can use trailing closure syntax for passing closures.
// Say there is a function whose last argument is a closure, we can put the closure directly outside the parenthesis

func doSomething(num:Int, closure: () -> Void) {
    closure()
    print("executing main function")
}


// Now while calling the function, instead of actually passing the closure to the function as argument, we can write it outside the parenthesis like this
doSomething(num: 10) {
    print("Executing closure")
}
