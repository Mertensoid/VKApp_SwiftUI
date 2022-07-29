//
//  FriendPhotoViewModel.swift
//  VKApp_SwiftUI
//
//  Created by admin on 29.07.2022.
//

import Foundation

class FriendPhotoViewModel: ObservableObject {
    
    let networkService: NetworkService = NetworkService()
    
    
    @Published var currentFriend: Int
    @Published var photos: [PhotoData] = []
    
    init(currentFriend: Int) {
        self.currentFriend = currentFriend
    }
    
    public func fetchPhotos() {
        let urlQI = URLQueryItem(name: "owner_id", value: String(self.currentFriend))
        networkService.fetchPhotos(urlQI: urlQI) { [weak self] result in
            switch result {
            case let .success(photos):
                self?.photos = photos
            case let .failure(error):
                print(error)
            }
        }
    }
}
