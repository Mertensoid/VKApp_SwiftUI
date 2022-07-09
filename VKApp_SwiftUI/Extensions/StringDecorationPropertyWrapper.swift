//
//  StringDecorationPropertyWrapper.swift
//  VKApp_SwiftUI
//
//  Created by admin on 07.07.2022.
//

import Foundation

enum StringDecorator {
    case camelCase
    case snakeCase
    case kebabCase
}

class StringDecoratorClass {

    var decorateMethod: StringDecorator = .camelCase
    
    func toCamelCase(startString: String) -> String {
        var resultString = ""
        var isAfterSpace = false
        for char in startString {
            if isAfterSpace && char != " " {
                resultString.append(contentsOf: char.uppercased())
                isAfterSpace = false
            } else if !isAfterSpace && char != " " {
                resultString.append(contentsOf: char.lowercased())
            } else {
                isAfterSpace = true
            }
        }
        return resultString
    }

    func toSnakeCase(startString: String) -> String {
        var resultString = ""
        for char in startString {
            if char != " " {
                resultString.append(contentsOf: char.lowercased())
            } else {
                resultString.append(contentsOf: "_")
            }
        }
        return resultString
    }

    func toKebabCase(startString: String) -> String {
        var resultString = ""
        for char in startString {
            if char != " " {
                resultString.append(contentsOf: char.lowercased())
            } else {
                resultString.append(contentsOf: "-")
            }
        }
        return resultString
    }
}

class MyClass {
    @Decorated(decorateString: .camelCase) var camelProperty = ""
    @Decorated(decorateString: .snakeCase) var snakeProperty = ""
    @Decorated(decorateString: .kebabCase) var kebabProperty = ""
}

@propertyWrapper
struct Decorated {
    
    private var value: String
    private let stringDecorator: StringDecorator
    private let stringDecoratorClass: StringDecoratorClass
    
    init(wrappedValue: String, decorateString: StringDecorator) {
        self.value = wrappedValue
        self.stringDecorator = decorateString
        self.stringDecoratorClass = StringDecoratorClass()
        stringDecoratorClass.decorateMethod = decorateString
    }
    
    private func get() -> String {
        return value
    }
    
    private mutating func set(_ newValue: String) {

        switch stringDecorator {
        case .camelCase:
            value = stringDecoratorClass.toCamelCase(startString: newValue)
        case .snakeCase:
            value = stringDecoratorClass.toSnakeCase(startString: newValue)
        case .kebabCase:
            value = stringDecoratorClass.toKebabCase(startString: newValue)
        }
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


