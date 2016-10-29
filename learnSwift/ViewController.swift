//
//  ViewController.swift
//  learnSwift
//
//  Created by oahgnehzoul on 2016/10/28.
//  Copyright © 2016年 oahgnehzoul. All rights reserved.
//

import UIKit

enum Rank: Int, ExampleProtocol {
    case Ace = 1
    case Two, Three, Four, Five, Six
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        default:
            return "queen"
        }
    }
    var simpleDesc: String {
        switch self {
        case .Ace:
            return "ace"
        default:
            return "other"
        }
    }
    func adjust() {
        print("a enum func protocol")
    }
    
}

struct Card: ExampleProtocol {
    var simpleDesc: String = "a simple struct"
    mutating func adjust() {
        simpleDesc += "adjusted"
    }
    var rank: Rank
//    func simpleDesc() -> String {
//        return "rank 's simpleDesc is \(rank.simpleDesc()) "
//    }
}

protocol ExampleProtocol {
    var simpleDesc: String { get }
    mutating func adjust()
}



extension Int: ExampleProtocol {
    var simpleDesc: String {
        return "the number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

protocol Protocol2 {
    var absoluteValue: Int { get }
}

extension Double: Protocol2 {
    var absoluteValue: Int {
        return (Int)(self)
    }
    
}

enum PrinterError: Error {
    case OutOfPaper
    case NoToner
    case OnFire
    
}

// 使用 throw 来爆乳错误，并用 thows 来表示可以抛出的错误函数
func sendToPrinter(printerName: String) throws -> String {
    if printerName == "Never has toner" {
        throw PrinterError.NoToner
    }
    return "Job sent"
}

class nameShape: ExampleProtocol {
    var simpleDesc: String = "a very simple class"
    func adjust() {
        simpleDesc += "now 100% adjusted"
    }

    var numberOfSides = 0
    
    let length = 4.0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    
}

// 非泛型结构体栈
struct IntStack {
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// 泛型结构体栈
struct Stack<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var shape = nameShape(name: "shape")
        shape.numberOfSides = 7
        var shapeDesc = shape.simpleDescription()
        
        print("learn swift!")
        
        print(1.simpleDesc)

        print(2.65.absoluteValue)
//        let test = SubShape(sideLength: 5.2, name: "subShape")
//        test.area()
//        test.simpleDescription()

        // 还有多种错误处理方式，do-catch
        
        do {
            let printerResponse = try sendToPrinter(printerName: "Bi Sheng")
            print(printerResponse)
        } catch {
            print(error)
        }

        
        // 泛型函数
        func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
            var result = [Item]()
            for _ in 0..<numberOfTimes {
                result.append(item)
            }
            return result
        }
//        repeatItem(repeating: "knock", numberOfTimes: 4)
        print("repeat:\(repeatItem(repeating: 2, numberOfTimes: 4))")
        
        
        // 泛型枚举
        enum OptionalValue<Wrapped> {
            case None
            case Some(Wrapped)
        }
        var possibleInteger: OptionalValue<Int> = .None
        possibleInteger = .Some(100)
        
        func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
            for (index, value) in array.enumerated() {
                if value == valueToFind {
                    return index
                }
            }
            return nil
        }

        
        
//        <T: Equatable> =  <T where T: Equatable>

        
        let ace = Rank.Jack
        let aceRawValue = ace.rawValue
        print("ace:\(ace),rawValue:\(aceRawValue)")

        
        if let convertedRank = Rank(rawValue: 3) {
            let threeDesc = convertedRank.simpleDescription()
        }
        
        let myTableView: UITableView = UITableView(frame: self.view.bounds, style: .grouped)
        
        self.view.addSubview(myTableView)
        
        let myTextField = UITextField(frame: CGRect(x: 20.0, y: 40.0, width: 200.0, height: 40.0))
        myTextField.text = "text"
        myTextField.backgroundColor = UIColor.white
        myTextField.textColor = UIColor.gray
//        let color = UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0)
        myTableView.backgroundColor = UIColor.gray
        myTableView.addSubview(myTextField)
        
//        let emptyArray = [String]()
//        let emptyDic = [String:Float]()
        
        let vegetable = "red pepper"
        switch vegetable {
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy /(x)?")
        default:
            print("1")
        }
    
        @discardableResult
        func greet(name: String, day: String) -> String {
            return "Hello \(name),today is \(day)"
        }
        greet(name: "lzh", day: "Tuesday")
        
        @discardableResult
        func sumOf(numbers: Int...) -> Int {
            var sum = 0
            for number in numbers {
                sum += number
            }
            return sum
        }
        sumOf(numbers: 42, 12)
        sumOf()
        
        
        func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
            for item in list {
                if condition(item) {
                    return true
                }
            }
            return false
        }
        
        func lessThanTen(num: Int) -> Bool {
            return num < 10
        }
        
//        var numbers = [20, 19, 7, 12]
//        hasAnyMatches(list: numbers, condition: lessThanTen)
//        
//        numbers.map { (number: Int) -> Int in
//            let result = 3 * number
//            return result
//        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

