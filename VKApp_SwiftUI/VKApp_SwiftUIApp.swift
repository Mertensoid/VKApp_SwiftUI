//
//  VKApp_SwiftUIApp.swift
//  VKApp_SwiftUI
//
//  Created by admin on 20.06.2022.
//

import SwiftUI

@main


struct VKApp_SwiftUIApp: App {
    @State var isAuthorized = false
    fileprivate static let tokenSavedPublisher = NotificationCenter.default.publisher(for: Notification.Name("vkTokenSaved"))
    
    var body: some Scene {
        WindowGroup {
            if isAuthorized {
                MainView()
            } else {
                VKLoginWebView().onReceive(VKApp_SwiftUIApp.tokenSavedPublisher) { _ in
                    self.isAuthorized.toggle()
                }
            }
            //ContainerView()
        }
    }
}
