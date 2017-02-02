//
//  UILabel+Extensions.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 02.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit
import Localize_Swift

enum LabelStyle: String {
    case HelveticaNeueCyrLight15VeryLightGray = "HelveticaNeueCyrLight15VeryLightGray"
}

extension UILabel {
    @IBInspectable var labelStyle: String? {
        set { setupWithStyleNamed(newValue) }
        get { return nil }
    }
    
    func setupWithStyleNamed(_ named: String?) {
        if let styleName = named, let labelStyle = LabelStyle(rawValue: styleName) {
            setupWithStyle(labelStyle)
        }
    }
    
    func setupWithStyle(_ labelStyle: LabelStyle) {
        text = text?.localized()
        
        switch labelStyle {
        case .HelveticaNeueCyrLight15VeryLightGray:
            font = UIFont.helveticaNeueCyrLight15
            textColor = UIColor(hexString: "#dedede", withAlpha: 1.0)
        }
        
        self.adjustsFontSizeToFitWidth = true
    }
}
