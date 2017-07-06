//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var a : String? = "hello"
print(a == nil)
var b : String? = nil
var c = "hi"
if let name = b{
    c = "hello,\(name)"
}else {
    print(c)
}

let nickName : String? = nil
let fullName :String = "he"
let info = "hi\(nickName ?? fullName)"

var n = 2
while n < 100 {
    n *= 2
}
for i in 1...4 {
    print(i)
}

func greet(money: String, _:String) -> String{
    return "hello \(money)"
}

greet(money:"123", "456")

func sum(numbers:Int...) -> Int {
    var sum = 0
    
    for num in numbers {
        sum += num
    }
    return sum
}
sum(numbers: 55, 90, 88, 70)

func averge(arr:Double...) -> Double {
    var aver = 0.0
    for num in arr {
        aver += num
    }
    aver = aver / Double(arr.count)
    return aver
}

averge(arr: 90.8,24.9,77.0)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
    
}
returnFifteen()

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(num:Int) -> Int {
        return num + 1
    }
    return addOne
}

var incrementer = makeIncrementer()
incrementer(5)

func hasAnyMatch(list:[Int], condition:(Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(num:Int) -> Bool {
    return num < 10
}

var num = [20, 99, 17, 88]
hasAnyMatch(list: num, condition: lessThanTen)


class Shape {
    var numberOfSides  = 0
    func simpleDescription() -> String {
        return "hello"
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NameShape{
    var numberOfSises = 0
    var name : String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A"
    }
}

class Squre: NameShape {
    var sideLength : Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSises = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "B"
    }
}

let  test = Squre(sideLength: 3.3, name: "my name")
test.area()
test.simpleDescription()
test.numberOfSises

class Circle: NameShape {
    var radius : Double
    init(radius: Double, name:String) {
        self.radius = radius
        super.init(name: name)
    }
    override func simpleDescription() -> String {
        return "\(name)"
    }
    func area() -> Double {
        return 2 * radius
    }
}

var circle = Circle(radius: 5.0, name: "张垚")
circle.simpleDescription()
circle.area()

class E:NameShape {
    var sideLength : Double = 0.0
    var value : Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSises = 3
    }
    var perimeter :Double{
        get {
            return 3 * sideLength
        }
        set {
            sideLength = newValue / 3.0
            value = newValue / 2.0
        }
    }
    
}

var triangle = E(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9
print(triangle.sideLength)
print(triangle.value)

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five
    case Six
    func simple() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Six:
            return "two"
        default:
            return "other"
        }
    }
}

let ace = Rank.Two
print(ace.rawValue)
ace.simple()
enum ServerResponse {
    case Result(String, String)
    case Failure(String)
}
let success = ServerResponse.Result("6.00 pm", "8.00 pm")
let failure = ServerResponse.Failure("fail")
switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "888\(sunrise)"
case let .Failure(message):
    print("mistake is \(message)")
    
}

protocol ExampleProtocol {
    var simpleDescription :String {
        get
    }
    mutating func adjust()
    
}

class simpleClass: ExampleProtocol {
    var simpleDescription: String = "simple Class"
    func adjust() {
        simpleDescription += "🙄"
    }
}
var ab = simpleClass()
ab.adjust()

extension Int : ExampleProtocol {
    var simpleDescription : String {
        return "the Number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
    
    
}
7.simpleDescription

let httpError = (500, "unConnect")
let (code, status) = httpError
print(httpError.1)

let possibleNumber = "f"
let number = Int(possibleNumber)

let age = 3
assert(age >= 0, "age can not be less than zero")



var surveyAnswer :String?
print(surveyAnswer ?? "hello")

func canThrowAnError() throws {
    
}

do {
    try canThrowAnError()
}catch {
    
}

let a1 = 9 % 4
let b1 = 9 % -4
print(a1, b1)
(1, "c") < (2, "b")
let m = 50 + (10 > 5 ? 20 : 40)
print(m)

let cat :[Character] = ["L", "O", "V", "E"]
let catString = String(cat)
print(catString)

let greeting = "hello my lady"
greeting[greeting.startIndex]
extension Int {
    var suqared : Int {
        return self * self
    }
}
5.suqared.suqared.suqared


//对class的协议
protocol Exprotocol {
    var simple : String {
        get
    }
    mutating func adjust()
}

class zhangYao : Exprotocol {
    var simple: String = "my age"
    func adjust() {
        simple += " is 26"
    }
}
let zhang = zhangYao()
zhang.simple
zhang.adjust()
zhang.simple
struct simpleStruct : Exprotocol {
    var simple: String = "struct"
    mutating func adjust() {
        simple = simple + "test"
        print(test)
    }
}

var struct1 = simpleStruct()
struct1.simple
struct1.adjust()
struct1.simple


extension Double {
    func absoluteValue() -> Double {
        return self > 0 ? self : -self
    }
}
(-3.2).absoluteValue()
Double(-2).absoluteValue()


var base = -1
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
    //print(answer)
}

repeat {
   base -= 1
    print(base)
}while base > 0

func someFunction(argumentLabel parameterName: Int) {
    print(parameterName)
}

someFunction(argumentLabel: 8)
func inoutFunc(a:inout Int, b:inout Int) {
    let c = a
    a = b
    b = c
    print(a, b)
}
var age1 = 3
var age2 = 5
inoutFunc(a: &age1, b: &age2)
func add(a: Int, b:Int) -> Int {
    return a + b
}
var func1 : (Int, Int) -> Int = add
print(func1(2, 3))

func new(func1: (Int, Int) -> Int, a: Int, b: Int) {
    print(func1(a, b))
}
new(func1: add, a: 3, b: 8)

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
print(chooseStepFunction(backward: 3 > 2))
var func3 = chooseStepFunction(backward: 5 < 4)
func3(2)

let names = ["a", "v", "h"]
var nameArr = names.sorted()
nameArr = names.sorted(by: <)
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}

// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
})

// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}
typealias nothing = () -> Void
typealias printNumber = (Int) -> ()
typealias add1 = (Int, Int) -> (Int)
typealias Add1 = (_ s1:Int, _ s2:Int) -> (Int)
let addCloser : Add1
addCloser = {
   (_ s1:Int, _ s2:Int) -> (Int) in
    return s1 + s2
}
addCloser(3, 5)

let addCloser1 : (Int, Int) -> (Int) = {
    return $0 + $1
}
addCloser1(9, 8)

let stringCloser : (String, String) -> (String) = {
    return $0 + $1
}

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var name : String?
}
let someVideoMode = VideoMode()
someVideoMode.resolution.width = 34

let hd = Resolution(width: 100, height: 100)
var cinema = hd
cinema.width = 200
print(hd.width)

let tenEighty = VideoMode()
tenEighty.name = "zhang"
var alsoTenEighty = tenEighty
alsoTenEighty.name = "li"
print(tenEighty.name!)












