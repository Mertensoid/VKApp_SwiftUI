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
        
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.friends) { friend in
                NavigationLink(destination: FriendPhotoView()) {
                    UserCell(userName: friend.name, userPicName: friend.friendPhoto)
                }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .padding(.all, 0)
            .navigationTitle("Friends")
            .onAppear(perform: viewModel.fetchFriends)
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(viewModel: FriendsViewModel())
    }
}
