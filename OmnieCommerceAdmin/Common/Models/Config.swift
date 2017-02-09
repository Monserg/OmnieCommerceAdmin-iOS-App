//
//  Config.swift
//  OmnieCommerce
//
//  Created by msm72 on 11.11.16.
//  Copyright © 2016 Omniesoft. All rights reserved.
//
//  http://www.colorhexa.com/009395
//  http://iosfonts.com
//

import UIKit

enum ThemeDesign: String {
    case LightForUser   =   "LightForUser"
    case LightForGuest  =   "LightForGuest"
    case DarkForUser    =   "DarkForUser"
    case DarkForGuest   =   "DarkForGuest"
}

typealias HandlerSendButtonCompletion               =   (() -> ())
typealias HandlerRegisterButtonCompletion           =   (() -> ())
typealias HandlerForgotPasswordButtonCompletion     =   (() -> ())
typealias HandlerCancelButtonCompletion             =   (() -> ())

//typealias apiResponse                               =   (success: Bool, error: Error?)
typealias apiResponse                               =   (success: Bool, error: String?)
//typealias PasswordCheckResult                   =   (strengthLevel: PasswordStrengthLevel, isValid: Bool)

struct Config {
    struct Constants {
        // FIXME: - DELETE AFTER TEST
        static let isUserGuest: Bool                =   false
        static let isAppThemesDark                  =   false
        static let errorMessageViewHeight: CGFloat  =   14
    }
    
    
    // MARK: - Functions
    func applyThemeDesign() -> ThemeDesign {
        switch Constants.isUserGuest {
        case true:
            return (Constants.isAppThemesDark) ? .DarkForGuest : .LightForGuest
            
        case false:
            return (Constants.isAppThemesDark) ? .DarkForUser : .LightForUser
        }
    }
}
