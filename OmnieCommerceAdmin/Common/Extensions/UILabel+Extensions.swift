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
    case HelveticaNeueCyrLight15VeryLightGray   =   "HelveticaNeueCyrLight15VeryLightGray"
    case HelveticaNeueCyrThin47VeryLightGray    =   "HelveticaNeueCyrThin47VeryLightGray"
    case UbuntuLight12VeryLightGray             =   "UbuntuLight12VeryLightGray"
    case UbuntuLightItalic12VerySoftRed         =   "UbuntuLightItalic12VerySoftRed"
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
            font        =   UIFont.helveticaNeueCyrLight15
            textColor   =   UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#dedede" : "#dedede", withAlpha: 1.0)
        
        case .HelveticaNeueCyrThin47VeryLightGray:
            font        =   UIFont.helveticaNeueCyrThin47
            textColor   =   UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#dedede" : "#dedede", withAlpha: 1.0)
            
        case .UbuntuLight12VeryLightGray:
            font        =   UIFont.ubuntuLight12
            textColor   =   UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#dedede" : "#dedede", withAlpha: 1.0)
            
        case .UbuntuLightItalic12VerySoftRed:
            font        =   UIFont.ubuntuLightItalic12
            textColor   =   UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#dc8181" : "#8b0000", withAlpha: 1.0)
    }
    
        self.adjustsFontSizeToFitWidth = true
    }
}
