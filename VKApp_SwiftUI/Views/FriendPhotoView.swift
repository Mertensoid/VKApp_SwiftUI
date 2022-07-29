//
//  FriendPhotoView.swift
//  VKApp_SwiftUI
//
//  Created by admin on 30.06.2022.
//

import SwiftUI

struct FriendPhotoView: View {
    
    @ObservedObject var viewModel: FriendPhotoViewModel
    
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
    
    init(viewModel: FriendPhotoViewModel) {
        self.viewModel = viewModel
        self.viewModel.fetchPhotos()
    }
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let adaptiveColumns = [GridItem(.adaptive(minimum: 80, maximum: 200))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns) {
                ForEach(0...19, id: \.self) { value in
                    //Image(viewModel.photos[value].photoSizes.last?.photoURL ?? "")
                    Image(friendsPhoto[value].picName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(alignment: .bottom) {
                            LikesCounter()
                        }
                }
            }
        }
    }
}

//struct FriendPhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendPhotoView()
//    }
//}
