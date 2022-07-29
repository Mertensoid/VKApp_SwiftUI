//
//  SessionSingleton.swift
//  VKApp_SwiftUI
//
//  Created by admin on 05.07.2022.
//

import Foundation

class SessionSingleton {
    var token: String = ""
    var userId: Int = 0
    
    static let instance = SessionSingleton()
    
    private init() {
        
    }
}
