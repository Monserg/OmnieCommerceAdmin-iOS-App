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

typealias HandlerSendButtonCompletion           =   (() -> ())
typealias HandlerRegisterButtonCompletion       =   (() -> ())
typealias HandlerForgotPasswordButtonCompletion =   (() -> ())
typealias HandlerCancelButtonCompletion         =   (() -> ())

struct Config {
    struct Constants {
        // FIXME: - DELETE AFTER TEST
        static let isUserGuest: Bool    =   true
        static let isAppThemesDark      =   false
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
