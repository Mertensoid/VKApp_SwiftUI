//
//  FriendPhoto.swift
//  VKApp_SwiftUI
//
//  Created by admin on 01.07.2022.
//

import Foundation

class FriendPhoto: Identifiable {
    
    let id: UUID = UUID()
    let picName: String
    
    internal init(picture: String) {
        self.picName = picture
    }
    
}
