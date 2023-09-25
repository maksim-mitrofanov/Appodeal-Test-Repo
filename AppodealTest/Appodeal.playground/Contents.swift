import Cocoa

var greeting = "Hello, playground"


// Int8 -128 / 0 / 127
// Only bools and +

// 1. Add value n times until max size is exceeded.
// 2. Take max negative value, add values until corresponding negative value is reached (corresponding to given value).

let value1 = 32
let value2 = 16
let maximumNegativeValue = -128

func invert(value: Int) -> Int {
    var output = 0
    
    if value >= 0 {
        for _ in 0...value {
            output += -1
        }
    } else {
        for _ in value...0 { output += 1 }
    }
    
    return output
}

func decrement(from value1: Int, _ value2: Int) -> Int {
    return value1 + invert(value: value2)
}

func multiply(_ value1: Int, _ value2: Int) -> Int {
    var output = 0
    
    // edge case: value2 < 0, value2 = 0
    
    // input 2, -3
    // input -2, -3
    
    if value2 >= 0 {
        for _ in 0...value2 {
            output += value1
        }
    } else {
        for _ in value2...0 {
            output += value1
        }
        
        output = invert(value: output)
    }
    return output
}


