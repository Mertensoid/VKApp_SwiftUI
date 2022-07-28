//
//  FriendPhotoView.swift
//  VKApp_SwiftUI
//
//  Created by admin on 30.06.2022.
//

import SwiftUI

struct FriendPhotoView: View {
    private var friendsPhoto: [FriendPhoto] = [
        FriendPhoto(picture: "summer-1"),
        FriendPhoto(picture: "summer-2"),
        FriendPhoto(picture: "summer-3"),
        FriendPhoto(picture: "summer-4"),
        FriendPhoto(picture: "summer-5"),
        FriendPhoto(picture: "summer-6"),
        FriendPhoto(picture: "summer-7"),
        FriendPhoto(picture: "summer-8"),
        FriendPhoto(picture: "summer-9"),
        FriendPhoto(picture: "summer-10"),
        FriendPhoto(picture: "summer-11"),
        FriendPhoto(picture: "summer-12"),
        FriendPhoto(picture: "summer-13"),
        FriendPhoto(picture: "summer-14"),
        FriendPhoto(picture: "summer-15"),
        FriendPhoto(picture: "summer-16"),
        FriendPhoto(picture: "summer-17"),
        FriendPhoto(picture: "summer-18"),
        FriendPhoto(picture: "summer-19"),
        FriendPhoto(picture: "summer-20")
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0...19, id: \.self) { value in
                    VStack{
                        Image(friendsPhoto[value].picName)
                            .scaleEffect(2)
                            .padding(.vertical, 30)
                            .overlay(alignment: .bottom) {
                                LikesCounter()
                            }
                        
                    }
                    
                        
                }
            }
        }
    }
}

struct FriendPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        FriendPhotoView()
    }
}
