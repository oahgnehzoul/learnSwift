//
//  SubShape.swift
//  learnSwift
//
//  Created by oahgnehzoul on 2016/10/29.
//  Copyright © 2016年 oahgnehzoul. All rights reserved.
//

import UIKit

class SubShape: Shape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        
        set {
            sideLength = newValue / 3.0
        }
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

var l = SubShape(sideLength: 3.1, name: "a triangle")
//print(l.perimeter)


