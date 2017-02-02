//
//  UIView+Extensions.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 02.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

extension UIView {
    func applyBackgroundTheme() {
        switch Config.Constants.isAppThemesDark {
        case true:
            backgroundColor = UIColor(hexString: "#252929", withAlpha: 1.0)
        
        default:
            backgroundColor = UIColor(hexString: "#25ab9d", withAlpha: 1.0)
        }
    }
}
