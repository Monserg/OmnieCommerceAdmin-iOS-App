//
//  UIView+Extensions.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 02.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: - Custom Functions
    func releasePrint(object: Any) {
        Swift.print(object)
    }
    
    func print(object: Any) {
        #if DEBUG
            Swift.print(object)
        #endif
    }

    func applyBackgroundTheme() {
        switch Config.Constants.isAppThemesDark {
        case true:
            backgroundColor = UIColor(hexString: "#252929", withAlpha: 1.0)
        
        default:
            backgroundColor = UIColor(hexString: (Config.Constants.isUserGuest) ? "#079897" : "#ececec", withAlpha: 1.0)
        }
    }
}
