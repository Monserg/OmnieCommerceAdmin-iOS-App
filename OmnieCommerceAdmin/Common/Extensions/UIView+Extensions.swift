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
        let themeDesign = Config().applyThemeDesign()

        switch themeDesign {
        case .LightForUser, .DarkForUser:
            backgroundColor = UIColor(hexString: "#ececec", withAlpha: 1.0)

        case .DarkForGuest:
            backgroundColor = UIColor(hexString: "#252929", withAlpha: 1.0)

        case .LightForGuest:
            backgroundColor = UIColor(hexString: "#079897", withAlpha: 1.0)
        }
    }
}
