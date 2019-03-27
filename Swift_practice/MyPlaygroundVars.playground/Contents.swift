import UIKit

// doing vars
var str = "Hello, playground"
var is_tanner = true
var bankBal = 2
var coffee = bankBal >= 5 ? "Order place" : "Account does not meet the mininum"

//

var fName = "tanner"
var lName = "campbell"
var suffix = " I"

var fullname = fName + " " + lName
fullname.append(suffix)

//fullname = fullname.capitalized

if(fullname.contains("tanner") || fullname.contains("campbell")) {
    print("Found our guy")
}else {
    print("Not our guy")
}

fullname = fullname.replacingOccurrences(of: "tanner", with: "The Man")
print(fullname)

var pitt = 44
var wvu = 45
var totalScore = pitt + wvu

var money: Double = 12312341241244124124

var big$: Float = 3.79

var remainder  = 14 % 5

func calcArea (length: Int, width: Int) -> Int {
    return length * width
}

print(calcArea(length: 10, width: 41))

func isEven (num: Int) -> String {
    return num % 2 == 0 ? "True" : "False"
}

print(isEven(num: 324));

var acctBal = 300.99
var item = 599.97

func purchaseItem (currentBal: inout Double, itemPrice: Double) {
    if itemPrice <= currentBal {
        currentBal = currentBal - itemPrice
        print("Purcased item for: $ \(itemPrice)")
    } else {
        print("Not enough money")
    }
}


extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        guard let index = index(of: object) else {return}
        remove(at: index)
    }
    
}

var myArray = ["cat", "barbecue", "pancake", "frog"]
//let objectToRemove = "cat"

myArray.remove(object: "cat") // ["barbecue", "pancake", "frog"]


// inheritance

class Vehicle {
    var tires = 4
    var make: String?
    var model: String?
    var year: String?
    var currentSpeed: Double = 0
    
    init() {
        print("Parent Class")
    }

    func drive(speedInc: Double) {
       currentSpeed += speedInc * 2
    }
    
    func brake(){
        
    }
}

class SportsCar: Vehicle {
    override init() {
        super.init()
        print("Child Class")
        make = "Mitsubishi"
        model = "3000GT"
        year = "1993"
    }
    override func drive(speedInc: Double) {
        currentSpeed += speedInc * 8
    }
}

let car = SportsCar().currentSpeed





// polymorphism
class Shape {
    var area: Double?
    func calArea(valA: Double, valB: Double) {
        
    }
}


class Triangle: Shape {
    override func calArea(valA: Double, valB: Double) {
        area = (valA * valB) / 2
        
    }
}

class Rectangle: Shape {
    override func calArea(valA: Double, valB: Double) {
        area = valA * valB
    }
}


