//
//  ContainerView.swift
//  VKApp_SwiftUI
//
//  Created by admin on 30.06.2022.
//

import SwiftUI

struct ContainerView: View {
    
    @State private var shouldShowMainView = false
    
    var body: some View {
        NavigationView {
            HStack {
                VKLoginWebView()
                //LoginView(isUserLoggedIn: $shouldShowMainView)
//                NavigationLink(destination: MainView(), isActive: $shouldShowMainView) {
//                    EmptyView()
//                }
            }
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
