//
//  CustomTextField.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 03.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit
import Navajo_Swift

enum FieldStyle: String {
    case Name       =   "Name"
    case Email      =   "Email"
    case Password   =   "Password"
}

enum PasswordStrengthLevel {
    case Weak
    case Reasonable
    case Strong
    case None
}

@IBDesignable class CustomTextField: UITextField {
    // MARK: - Properties
    var attributedPlaceholderString: NSAttributedString!
    private var validator = NJOPasswordValidator.standardValidator

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
        textColor                           =   (Config.Constants.isAppThemesDark) ? (UIColor(hexString: "#dedede", withAlpha: 1.0)) : (UIColor(hexString: "#dedede", withAlpha: 1.0))
        tintColor                           =   (Config.Constants.isAppThemesDark) ? (UIColor(hexString: "#dedede", withAlpha: 1.0)) : (UIColor(hexString: "#dedede", withAlpha: 1.0))

        // Placeholder design
        attributedPlaceholder = NSAttributedString(string: (placeholder?.localized())!, attributes: [NSFontAttributeName: UIFont.ubuntuLightItalic12, NSForegroundColorAttributeName: (Config.Constants.isAppThemesDark) ? (UIColor(hexString: "#5e6969", withAlpha: 1.0))! : (UIColor(hexString: "#9ec9c6", withAlpha: 1.0))!, NSKernAttributeName: 0.0, NSParagraphStyleAttributeName: paragraphStyle])

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
    
    func checkPasswordStrength(_ password: String) -> PasswordStrengthLevel {
        let strengthLevelString = Navajo.localizedString(for: Navajo.strength(of: password))
        var strengthLevel: PasswordStrengthLevel!
        
        switch strengthLevelString {
        case "Very Weak", "Weak":
            strengthLevel = .Weak
            
        case "Reasonable":
            strengthLevel = .Reasonable
            
        case "Strong", "Very Strong":
            strengthLevel = .Strong
            
        default:
            strengthLevel = .None
        }
        
        return strengthLevel
    }
    
    func checkPasswordValidation(_ password: String) -> Bool {
        let lengthRule = NJOLengthRule(min: 8, max: 24)
        validator = NJOPasswordValidator(rules: [lengthRule])
        
        if let failingRules = validator.validate(password) {
            var errorMessages: [String] =   []
            
            failingRules.forEach { rule in
                errorMessages.append(rule.localizedErrorDescription)
            }
            
            return false
        } else {
            return true
        }
    }
    
    func checkPhoneValidation(_ phone: String) -> Bool {
        // Validate Phone number
        guard !(phone.isEmpty) else {
            return true
        }
        
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = phone.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        let resultPhone = phone == filtered
        
        print(object: "resultPhone = \(resultPhone)")
        
        return resultPhone
    }

    func checkEmailValidation(_ email: String) -> Bool {
        // Validate Email
        guard !(email.isEmpty) else {
            return true
        }
        
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let resultEmail = emailTest.evaluate(with: email)
        
        print(object: "resultEmail = \(resultEmail)")
        
        return resultEmail
    }

    func checkPhoneEmailValidation(_ text: String) -> Bool {
        return checkPhoneValidation(text) || checkEmailValidation(text)
    }
}
