//
//  MainView.swift
//  VKApp_SwiftUI
//
//  Created by admin on 30.06.2022.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            FriendsView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Friends")
                }
                .tag(0)
            GroupsView()
                .tabItem {
                    Image(systemName: "ellipsis.bubble")
                    Text("Groups")
                }
                .tag(1)
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
                .tag(2)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
