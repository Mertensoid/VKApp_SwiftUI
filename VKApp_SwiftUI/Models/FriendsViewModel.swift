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
//    let testFriends: [FriendData] = [
//        FriendData(friendID: 123, name: "123", surName: "123", friendPhoto: "123")
//    ]
    
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




