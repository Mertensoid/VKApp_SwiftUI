//
//  NetworkService.swift
//  VKApp_SwiftUI
//
//  Created by admin on 05.07.2022.
//

import Foundation
import UIKit

protocol FriendService {
    func fetchFriends(completion: @escaping (Result<[FriendData], Error>) -> Void)
}

class NetworkService {
    
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    let requestComponents: URLComponents = {
        var comp = URLComponents()
        comp.scheme = "https"
        comp.host = "api.vk.com"
        comp.queryItems = [
            URLQueryItem(name: "access_token", value: SessionSingleton.instance.token),
            URLQueryItem(name: "v", value: "5.131"),
        ]
        return comp
    }()

    func fetchFriends(completion: @escaping (Result<[FriendData], Error>) -> Void) {
        var friendsRequestComponents = requestComponents
        friendsRequestComponents.path = "/method/friends.get"
        friendsRequestComponents.queryItems?.append(
            contentsOf: [
                URLQueryItem(name: "user_id", value: String(SessionSingleton.instance.userId)),
                URLQueryItem(name: "fields", value: "photo_100"),
                URLQueryItem(name: "order", value: "name")
            ]
        )
        guard let url = friendsRequestComponents.url else { return }
        let getFriendsTask = session.dataTask(with: url) { (data, response, error) in
            guard
                let _ = response as? HTTPURLResponse,
                error == nil,
                let data = data
            else { return }
            do {
                let friendResponse = try JSONDecoder().decode(
                    VKResponse<FriendItems>.self,
                    from: data)
                completion(.success(friendResponse.response.friends))
            } catch {
                completion(.failure(error))
            }
        }
        getFriendsTask.resume()
    }
    
    func fetchPhotos(urlQI: URLQueryItem, completion: @escaping (Result<[PhotoData], Error>) -> Void) {
        var photosRequestComponents = requestComponents
        photosRequestComponents.path = "/method/photos.getAll"
        photosRequestComponents.queryItems?.insert(
            urlQI,
            at: 0)
        guard let url = photosRequestComponents.url else { return }
        let getPhotosTask = session.dataTask(with: url) { (data, response, error) in
            guard
                let _ = response as? HTTPURLResponse,
                error == nil,
                let data = data
            else { return }
            do {
                let photoResponse = try JSONDecoder().decode(
                    VKResponse<PhotoItems>.self,
                    from: data)
                completion(.success(photoResponse.response.photos))
            } catch {
                completion(.failure(error))
            }
        }
        getPhotosTask.resume()
    }
    
    func fetchGroups(completion: @escaping (Result<[GroupData], Error>) -> Void) {
        var groupsRequestComponents = requestComponents
        groupsRequestComponents.path = "/method/groups.get"
        groupsRequestComponents.queryItems?.append(
            contentsOf: [
                URLQueryItem(name: "extended", value: "1"),
                URLQueryItem(name: "user_id", value: String(SessionSingleton.instance.userId))
            ]
        )
        guard let url = groupsRequestComponents.url else { return }
        let getGroupsTask = session.dataTask(with: url) { (data, response, error) in
            guard
                let _ = response as? HTTPURLResponse,
                error == nil,
                let data = data
            else { return }
            do {
                let groupResponse = try JSONDecoder().decode(
                    VKResponse<GroupItems>.self,
                    from: data)
                completion(.success(groupResponse.response.groupData))
            } catch {
                completion(.failure(error))
            }
        }
        getGroupsTask.resume()
    }
    
//    func searchGroups(urlQI: URLQueryItem, completion: @escaping (Result<[GroupData], Error>) -> Void) {
//        var groupsRequestComponents = requestComponents
//        groupsRequestComponents.path = "/method/groups.search"
//        groupsRequestComponents.queryItems?.append(
//            contentsOf: [
//                URLQueryItem(name: "count", value: "100")
//            ]
//        )
//        if let search = urlQI.value {
//            if !search.isEmpty {
//                groupsRequestComponents.queryItems?.insert(urlQI, at: 0)
//            }
//        }
//        guard let url = groupsRequestComponents.url else { return }
//        let task = session.dataTask(with: url) { (data, response, error) in
//            guard
//                let _ = response as? HTTPURLResponse,
//                error == nil,
//                let data = data
//            else { return }
//            do {
//                let groupResponse = try JSONDecoder().decode(
//                    VKResponse<GroupItems>.self,
//                    from: data)
//                completion(.success(groupResponse.response.groupData))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
}
