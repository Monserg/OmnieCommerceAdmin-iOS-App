//
//  CustomTextField.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 03.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

enum FieldStyle: String {
    case Name = "Name"
    case Password = "Password"
}

@IBDesignable class CustomTextField: UITextField {
    // MARK: - Properties
    // MARK: - Properties
    var attributedPlaceholderString: NSAttributedString!
    
    @IBInspectable var fieldLast: Bool? {
        set { returnKeyType = (newValue)! ? .default : .next }
        get { return false }
    }
    
    @IBInspectable var fieldStyle: String? {
        set {
            if let styleName = newValue, let fieldStyle = FieldStyle(rawValue: styleName) {
                setupWithStyle(fieldStyle)
            }
        }
        
        get { return nil }
    }
    
    
    // MARK: - Custom Functions
    func setupWithStyle(_ fieldStyle: FieldStyle) {
        guard fieldLast != nil else {
            return
        }
        
        tintColor = (Config.Constants.isAppThemesDark) ? (UIColor(hexString: "#5e6969", withAlpha: 1.0)) : (UIColor(hexString: "#9ec9c6", withAlpha: 1.0))
        keyboardAppearance = (Config.Constants.isAppThemesDark) ? .light : .dark
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent  =   0
        clearButtonMode                     =   .whileEditing

        switch fieldStyle {
        case .Name:
            autocapitalizationType          =   .sentences
            autocorrectionType              =   .no
            spellCheckingType               =   .no
            keyboardType                    =   .default
            keyboardAppearance              =   .default
            enablesReturnKeyAutomatically   =   true
            font                            =   UIFont.ubuntuLight12
            textColor                       =   (Config.Constants.isAppThemesDark) ? (UIColor(hexString: "#5e6969", withAlpha: 1.0)) : (UIColor(hexString: "#9ec9c6", withAlpha: 1.0))

            // Placeholder design
            attributedPlaceholder = NSAttributedString(string: (placeholder?.localized())!, attributes: [NSFontAttributeName: UIFont.ubuntuLightItalic12, NSForegroundColorAttributeName: UIColor(hexString: "#dedede", withAlpha: 1.0)!, NSKernAttributeName: 0.0, NSParagraphStyleAttributeName: paragraphStyle])

        case .Password:
            autocapitalizationType          =   .none
            autocorrectionType              =   .no
            spellCheckingType               =   .no
            keyboardType                    =   .default
            keyboardAppearance              =   .default
            enablesReturnKeyAutomatically   =   true
            isSecureTextEntry               =   true
            font                            =   UIFont.ubuntuLight12
            textColor                       =   (Config.Constants.isAppThemesDark) ? (UIColor(hexString: "#5e6969", withAlpha: 1.0)) : (UIColor(hexString: "#9ec9c6", withAlpha: 1.0))
            
            // Placeholder design
            attributedPlaceholder = NSAttributedString(string: (placeholder?.localized())!, attributes: [NSFontAttributeName: UIFont.ubuntuLightItalic12, NSForegroundColorAttributeName: UIColor(hexString: "#dedede", withAlpha: 1.0)!, NSKernAttributeName: 0.0, NSParagraphStyleAttributeName: paragraphStyle])
        }
    }
}
