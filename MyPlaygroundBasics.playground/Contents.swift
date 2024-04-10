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
