//
//  AvatarAnimationBounceEffect.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import SwiftUI
import Kingfisher

struct AvatarAnimationBounceEffect: View {
    
    @State var isAnimated = false
    
    var image: String
    
    var body: some View {
        VStack {
            KFImage(
                URL(
                    string: image
                )
            )
            .offset(y: isAnimated ? 0 : -80)
            .animation(
                .interpolatingSpring(
                    stiffness: 350,
                    damping: 5,
                    initialVelocity: 10
                )
            )
            .onTapGesture {
                self.isAnimated.toggle()
            }
        }
    }
}

struct CustomAnimation: ViewModifier {
    var image: String
    func body(content: Content) -> some View {
        AvatarAnimationBounceEffect(
            isAnimated: true,
            image: image)
    }
}

extension View {
    func animateWithBounceEffect(image: String) -> some View {
        return self.modifier(
            CustomAnimation(image: image)
        )
    }
}

struct AvatarAnimationBounceEffect_Previews: PreviewProvider {
    static var previews: some View {
        AvatarAnimationBounceEffect(
            isAnimated: false,
            image: ""
        )
    }
}

