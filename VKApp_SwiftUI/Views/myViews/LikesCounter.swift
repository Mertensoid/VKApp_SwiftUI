//
//  LikesCounter.swift
//  VKApp_SwiftUI
//
//  Created by admin on 17.07.2022.
//

import SwiftUI

//extension AnyTransition {
//    static var flipImage: AnyTransition {
//
//    }
//}

struct LikesCounter: View {
    
    @State var isLiked: Bool = false
    @State private var picture: String = "heart"
    @State private var rotation: Double = 0
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(width: 90, height: 30, alignment: .bottom)
            .overlay {
                HStack {
                    Image(systemName: picture)
                        .foregroundColor(.red)
                        .rotationEffect(Angle(degrees: rotation))
                        .animation(Animation.linear(duration: 0.25))
                        .onTapGesture {
                            withAnimation {
                                isLiked.toggle()
                                rotation += 360
                                if isLiked {
                                    self.picture = "heart.fill"
                                } else {
                                    self.picture = "heart"
                                }
                            }
                        }
                    Text("123")
                        .foregroundColor(.red)
                
                }
                .opacity(1)
            }
            .opacity(0.7)
    }
}

struct LikesCounter_Previews: PreviewProvider {
    static var previews: some View {
        LikesCounter()
    }
}


