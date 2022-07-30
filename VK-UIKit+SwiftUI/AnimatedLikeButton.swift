//
//  AnimatedLikeButton.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import SwiftUI

struct AnimatedLikeButton : View {
    
    @State var isPressed = false
    
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .opacity(isPressed ? 1 : 0)
                .scaleEffect(isPressed ? 1.0 : 0.1)
                .animation(.linear)
            Image(systemName: "heart")
        }.font(.system(size: 40))
            .onTapGesture {
                self.isPressed.toggle()
        }
        .foregroundColor(isPressed ? .red : .black)
    }
}

struct AnimatedLikeButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedLikeButton(isPressed: false)
    }
}
