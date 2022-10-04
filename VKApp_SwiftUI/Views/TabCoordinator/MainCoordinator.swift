//
//  MainCoordinator.swift
//  VKApp_SwiftUI
//
//  Created by admin on 28.07.2022.
//

import Foundation

enum MainTab {
    case friends
    case groups
    case news
}

class MainCoordinator: ObservableObject {
    
    @Published var tab = MainTab.friends
    
}
