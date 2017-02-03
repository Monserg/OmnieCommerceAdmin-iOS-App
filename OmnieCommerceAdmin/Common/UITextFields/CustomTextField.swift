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
        
        switch fieldStyle {
        case .Name:
            autocapitalizationType          =   .sentences
            autocorrectionType              =   .no
            spellCheckingType               =   .no
            keyboardType                    =   .default
            keyboardAppearance              =   .default
            enablesReturnKeyAutomatically   =   true

        case .Password:
            autocapitalizationType          =   .none
            autocorrectionType              =   .no
            spellCheckingType               =   .no
            keyboardType                    =   .default
            keyboardAppearance              =   .default
            enablesReturnKeyAutomatically   =   true
            isSecureTextEntry               =   true
        }
    }
}
