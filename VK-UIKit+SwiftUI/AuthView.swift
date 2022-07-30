//
//  AuthView.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import SwiftUI

struct AuthView: View {
    @State private var showMainScreen = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(
                    isUserLoggedIn: $showMainScreen
                )
                NavigationLink(
                    destination: ContactPickerView(),
                    isActive: $showMainScreen
                ) {
                    EmptyView()
                }
            }.background(
                Color(
                    red: 0.5,
                    green: 0.6,
                    blue: 0.9
                )
            )
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
