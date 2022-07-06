//
//  FriendsView.swift
//  VKApp_SwiftUI
//
//  Created by admin on 01.07.2022.
//

import SwiftUI

struct FriendsView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Иванов Иван Иванович", imageName: "essentials-1"),
        Friend(name: "Сидоров Степан Иннокентьевич", imageName: "essentials-2"),
        Friend(name: "Прохоров Александр Геннадьевич", imageName: "essentials-3"),
        Friend(name: "Мацук Максим Александрович", imageName: "essentials-4"),
        Friend(name: "Степанов Сергей Иванович", imageName: "essentials-5"),
        Friend(name: "Грач Анатолий Романович", imageName: "essentials-6"),
        Friend(name: "Мацук Максим Александрович", imageName: "essentials-4"),
        Friend(name: "Степанов Сергей Иванович", imageName: "essentials-5"),
        Friend(name: "Грач Анатолий Романович", imageName: "essentials-6")
    ]
    
    var body: some View {
        List(friends) { friend in
            Section(header: FriendsHeaderView()) {
                NavigationLink(destination: FriendPhotoView()) {
                    UserCell(userName: friend.name, userPicName: friend.imageName)
                }
            }
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.all, 0)
        .navigationTitle("Friends")
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
