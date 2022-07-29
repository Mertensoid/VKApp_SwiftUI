//
//  FriendsView.swift
//  VKApp_SwiftUI
//
//  Created by admin on 01.07.2022.
//

import SwiftUI

struct FriendsView: View {
    
    @ObservedObject var viewModel: FriendsViewModel
    
    init(viewModel: FriendsViewModel) {
        self.viewModel = viewModel
        self.viewModel.fetchFriends()
        
    }
    
    var body: some View {
        List(viewModel.friends) { friend in
            NavigationLink(destination: FriendPhotoView(viewModel: FriendPhotoViewModel(currentFriend: friend.friendID))) {
                UserCell(userName: friend.name, userPicName: friend.friendPhoto)
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
        FriendsView(viewModel: FriendsViewModel())
    }
}
