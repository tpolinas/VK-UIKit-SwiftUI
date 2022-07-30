//
//  ViewController.swift
//  VK-UIKit+SwiftUI
//
//  Created by Polina Tikhomirova on 25.07.2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var theContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var showUserScreens = false
        if showUserScreens {
            let childView = UIHostingController(rootView: AuthView())
            addChild(childView)
            view.addSubview(childView.view)
            childView.view.frame = theContainer.bounds
            theContainer.addSubview(childView.view)
            childView.didMove(toParent: self)
            showUserScreens = true
            let delegate = ContactPickerDelegate()
            let vc = UIHostingController(rootView: AuthView())
            present(vc, animated: true)
            delegate.didChange.sink { (delegate) in
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            let childView = UIHostingController(rootView: VKLoginWebView())
            addChild(childView)
            view.addSubview(childView.view)
            childView.view.frame = theContainer.bounds
            theContainer.addSubview(childView.view)
            childView.didMove(toParent: self)
            let delegate = ContactPickerDelegate()
            let vc = UIHostingController(rootView: VKLoginWebView())
            present(vc, animated: true)
            delegate.didChange.sink { (delegate) in
                self.dismiss(animated: true, completion: nil)
            }
            let childView1 = UIHostingController(rootView: AuthView())
            addChild(childView1)
            view.addSubview(childView1.view)
            childView1.view.frame = theContainer.bounds
            theContainer.addSubview(childView1.view)
            childView1.didMove(toParent: self)
            showUserScreens = true
            let delegate1 = ContactPickerDelegate()
            let vc1 = UIHostingController(rootView: AuthView())
            present(vc1, animated: true)
            delegate1.didChange.sink { (delegate1) in
                self.dismiss(animated: true, completion: nil)
            showUserScreens = true
            self.view.layoutIfNeeded()
        }
    }
//        let childView = UIHostingController(rootView: ContactPickerView())
//        addChild(childView)
//        view.addSubview(childView.view)
//        childView.view.frame = theContainer.bounds
//        theContainer.addSubview(childView.view)
//        childView.didMove(toParent: self)
//
//        let delegate = ContactPickerDelegate()
//        let vc = UIHostingController(rootView: ContactPickerView())
//        present(vc, animated: true)
//        delegate.didChange.sink { (delegate) in
//            self.dismiss(animated: true, completion: nil)
//        }
    }
}

