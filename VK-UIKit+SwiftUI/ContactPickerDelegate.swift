//
//  ContactPickerDelegate.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 25.07.2022.
//

import Foundation
import Combine

class ContactPickerDelegate: ObservableObject {
    
    var willChange = PassthroughSubject<ContactPickerDelegate, Never>()
    var didChange = PassthroughSubject<ContactPickerDelegate, Never>()
    
    var contact: String? {
        willSet {
            willChange.send(self)
        }
        
        didSet {
            didChange.send(self)
        }
    }
}
