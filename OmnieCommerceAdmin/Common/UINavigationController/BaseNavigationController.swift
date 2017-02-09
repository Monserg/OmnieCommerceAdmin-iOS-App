//
//  BaseNavigationController.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 09.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

enum BarButtonImageStyle: String {
    case Menu = "icon-navbar-menu-normal"
}

class BaseNavigationController: UINavigationController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set status bar color
        UIApplication.shared.statusBarStyle = .lightContent
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = UIColor(hexString: "#333333", withAlpha: 1.0)

        // Set navbar settings
        UINavigationBar.appearance().tintColor = UIColor(hexString: "#009395", withAlpha: 1.0)
        UINavigationBar.appearance().barTintColor = UIColor(hexString: "#333333", withAlpha: 1.0)
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().clipsToBounds = true
        UINavigationBar.appearance().titleTextAttributes = [ NSFontAttributeName: UIFont.helveticaNeueCyrLight15, NSForegroundColorAttributeName: UIColor.veryLightGray ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Custom Functions
    func addLeftMenuBarButton(withImage image: BarButtonImageStyle) {
        switch image {
        case .Menu:
//            let leftBarButton = UIBarButtonItem(image: UIImage.init(named: image.rawValue), style: .plain, target: self, action: #selector(handlerMenuBarButtonTap))
            let leftBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handlerMenuBarButtonTap))
            navigationItem.rightBarButtonItem = leftBarButton
        }
    }
    
    
    // MARK: - Actions
    func handlerMenuBarButtonTap() {
        // TOD: - ADD HANDLER
        
    }
}
