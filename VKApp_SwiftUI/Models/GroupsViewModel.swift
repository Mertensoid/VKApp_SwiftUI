//
//  GroupsViewModel.swift
//  VKApp_SwiftUI
//
//  Created by admin on 29.07.2022.
//

import Foundation

class GroupsViewModel: ObservableObject {
    
    let networkService = NetworkService()
    
    @Published var groups: [GroupData] = []
    
    public func fetchGroups() {
        networkService.fetchGroups { [weak self] result in
            switch result {
            case let .success(groups):
                self?.groups = groups
            case let .failure(error):
                print(error)
            }
        }
    }
}
