//
//  GroupsView.swift
//  VKApp_SwiftUI
//
//  Created by admin on 01.07.2022.
//

import SwiftUI




struct GroupsView: View {
    
    @ObservedObject var viewTestModel: FriendsViewModel

    init(viewModel: FriendsViewModel) {
        self.viewTestModel = viewModel
        
    }
    
    var body: some View {
        NavigationView {
            List(viewTestModel.friends) { friend in
                NavigationLink(destination: FriendPhotoView()) {
                    UserCell(userName: friend.name, userPicName: friend.friendPhoto)
                }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .padding(.all, 0)
            .navigationTitle("Groups")
            .onAppear(perform: viewTestModel.fetchFriends)
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView(viewModel: FriendsViewModel())
    }
}
