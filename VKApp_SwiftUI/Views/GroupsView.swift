//
//  GroupsView.swift
//  VKApp_SwiftUI
//
//  Created by admin on 01.07.2022.
//

import SwiftUI

struct GroupsView: View {
    
    @ObservedObject var viewTestModel: GroupsViewModel

    init(viewModel: GroupsViewModel) {
        self.viewTestModel = viewModel
        self.viewTestModel.fetchGroups()
        
    }
    
    var body: some View {
        List(viewTestModel.groups) { group in
            NavigationLink(destination: CurrentGroupView()) {
                GroupCell(groupName: group.groupName, groupPicName: group.groupPic)
            }
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.all, 0)
        .navigationTitle("Groups")
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView(viewModel: GroupsViewModel())
    }
}
