//
//  StringDecorationPropertyWrapper.swift
//  VKApp_SwiftUI
//
//  Created by admin on 07.07.2022.
//

import Foundation
import UIKit


enum StringDecorator {
    case camelCase
    case snakeCase
    case kebabCase
}

class MyClass {
    @Decorated(decorateString: .camelCase) var myProperty = ""
}

@propertyWrapper
struct Decorated<String> {
    
    private var value: String
    private let stringDecorator: StringDecorator
    
    
    
    init(wrappedValue: String, decorateString: StringDecorator) {
        self.value = wrappedValue
        self.stringDecorator = decorateString
    }
    
    private func get() -> String {
        return value
    }
    
    private mutating func set(_ newValue: String) {
        
        var decoratedString = newValue
        
        switch stringDecorator {
//        case .camelCase:
//            for index in newValue.indices {
//                <#code#>
//            }
//        case .snakeCase:
//            <#code#>
//        case .kebabCase:
//            <#code#>
//        }
        value = newValue
    }
    
    public var wrappedValue: String {
        get {
            get()
        }
        set {
            set(newValue)
        }
    }
}

let myClass = MyClass()
let property = myClass.myProperty
myClass.myProperty = "1"
