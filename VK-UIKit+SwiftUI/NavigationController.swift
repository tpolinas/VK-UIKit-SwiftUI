//
//  NavigationController.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 26.07.2022.
//

import UIKit
import SwiftUI

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [UIHostingController(rootView: ContactPickerView())]
    }

    override var title: String? {
       get { tabBarItem.title }
       set { navigationItem.title = newValue }
    }

}
