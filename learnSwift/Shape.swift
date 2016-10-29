//
//  Shape.swift
//  learnSwift
//
//  Created by oahgnehzoul on 2016/10/29.
//  Copyright © 2016年 oahgnehzoul. All rights reserved.
//

import UIKit



class Shape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    


}






