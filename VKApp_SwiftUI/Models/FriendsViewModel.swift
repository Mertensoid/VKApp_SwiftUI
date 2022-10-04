//
//  FriendViewModel.swift
//  VKApp_SwiftUI
//
//  Created by admin on 05.07.2022.
//

import Foundation

class FriendsViewModel: ObservableObject {
    
    let networkService: NetworkService = NetworkService()
    
    @Published var friends: [FriendData] = []
    
//    init(friendService: FriendService) {
//        self.friendService = friendService
//    }
    
    public func fetchFriends() {
        networkService.fetchFriends { [weak self] result in
            switch result {
            case let .success(friends):
                self?.friends = friends
            case let .failure(error):
                print(error)
            }
        }
    }
}




