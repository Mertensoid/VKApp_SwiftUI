//
//  CellPictureViewBuilder.swift
//  VKApp_SwiftUI
//
//  Created by admin on 28.06.2022.
//

import SwiftUI

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    func body(content: Content) -> some View {
        content
            .background(Circle()
                            .fill(Color.white)
                            .shadow(color: shadowColor, radius: shadowRadius, x: 5, y: 5))
    }
}

extension View {
    func circleShadow(color: Color, radius: CGFloat) -> some View {
        return self.modifier(CircleShadow(shadowColor: .blue, shadowRadius: 5))
    }
}
    
struct CellImage: View {
    var content: Image
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    var body: some View {
        content
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 64, height: 64)
            .cornerRadius(64)
            .circleShadow(color: .red, radius: 10)
    }
}
