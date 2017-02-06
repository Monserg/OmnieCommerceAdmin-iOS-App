//
//  CustomTextField.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 03.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

enum FieldStyle: String {
    case Name       =   "Name"
    case Email      =   "Email"
    case Password   =   "Password"
}

@IBDesignable class CustomTextField: UITextField {
    // MARK: - Properties
    var attributedPlaceholderString: NSAttributedString!
    
    @IBInspectable var fieldStyle: String? {
        set {
            if let styleName = newValue, let fieldStyle = FieldStyle(rawValue: styleName) {
                setupWithStyle(fieldStyle)
            }
        }
        
        get { return nil }
    }
    
    
    // MARK: - Class Functions
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let originalRect = super.clearButtonRect(forBounds: bounds)
        
        return CGRect.init(origin: CGPoint.init(x: originalRect.origin.x, y: originalRect.origin.y), size: originalRect.size)
    }
    
    
    // MARK: - Custom Functions
    // tag = 99: self is last with Return keyboard button
    func setupWithStyle(_ fieldStyle: FieldStyle) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent  =   0
        
        autocapitalizationType              =   .sentences
        autocorrectionType                  =   .no
        spellCheckingType                   =   .no
        keyboardType                        =   .default
        keyboardAppearance                  =   (Config.Constants.isAppThemesDark) ? .light : .dark
        enablesReturnKeyAutomatically       =   true
        returnKeyType                       =   (tag == 99) ? .default : .next
        isSecureTextEntry                   =   false
        clearButtonMode                     =   .whileEditing
        font                                =   UIFont.ubuntuLight12
        textColor                           =   (Config.Constants.isAppThemesDark) ? (UIColor(hexString: "#5e6969", withAlpha: 1.0)) : (UIColor(hexString: "#9ec9c6", withAlpha: 1.0))
        tintColor                           =   (Config.Constants.isAppThemesDark) ? (UIColor(hexString: "#5e6969", withAlpha: 1.0)) : (UIColor(hexString: "#9ec9c6", withAlpha: 1.0))

        // Placeholder design
        attributedPlaceholder = NSAttributedString(string: (placeholder?.localized())!, attributes: [NSFontAttributeName: UIFont.ubuntuLightItalic12, NSForegroundColorAttributeName: UIColor(hexString: "#dedede", withAlpha: 1.0)!, NSKernAttributeName: 0.0, NSParagraphStyleAttributeName: paragraphStyle])

        // Set differences
        switch fieldStyle {
        case .Email:
            autocapitalizationType          =   .none
            keyboardType                    =   .emailAddress
            
        case .Password:
            autocapitalizationType          =   .none
            isSecureTextEntry               =   true
            
        // Name
        default:
            break
        }
    }
}
