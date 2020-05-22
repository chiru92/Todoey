//
//  UIViewController + Extension.swift
//  Todoey
//
//  Created by Qrati Labs on 5/22/20.
//  Copyright © 2020 Qrati Labs. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setStatusBar(_ style: UIStatusBarStyle, color: UIColor? = UIColor.systemBlue) {
        if #available(iOS 13, *) {
            let app = UIApplication.shared
            
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            let statusBarView = UIView()
            statusBarView.backgroundColor = color
            view.addSubview(statusBarView)
            
            statusBarView.translatesAutoresizingMaskIntoConstraints = false
            statusBarView.heightAnchor.constraint(equalToConstant: statusBarHeight).isActive = true
            statusBarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            statusBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        else {
            if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
                statusBar.backgroundColor = style == .lightContent ? color : .white
                statusBar.setValue(style == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
            }
        }
    }
}
