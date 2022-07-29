//
//  MainView.swift
//  VKApp_SwiftUI
//
//  Created by admin on 30.06.2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.tab) {
            NavigationView {
                FriendsView(viewModel: FriendsViewModel())
            }
            .tabItem {
                Image(systemName: "person.3")
                Text("Friends")
            }
            .tag(MainTab.friends)
            NavigationView {
                GroupsView(viewModel: GroupsViewModel())
            }
            .tabItem {
                Image(systemName: "ellipsis.bubble")
                Text("Groups")
            }
            .tag(MainTab.groups)
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
                .tag(MainTab.news)
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
