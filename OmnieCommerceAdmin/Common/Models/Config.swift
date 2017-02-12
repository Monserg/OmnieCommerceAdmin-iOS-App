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
import MapKit

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
typealias HandlerNavBarLeftButtonCompletion         =   (() -> ())
typealias HandlerLocationCompletion                 =   ((_ placemark: CLPlacemark?) -> ())
typealias HandlerImagePickerControllerCompletion    =   ((_ originalImage: UIImage) -> ())
typealias HandlerLocationAddButtonCompletion        =   ((_ pointAnnotation: PointAnnotation) -> ())

typealias ResponseAPI                               =   (success: Bool, error: String?)
typealias ResultLocation                            =   (placemark: CLPlacemark?, coordinate: CLLocationCoordinate2D?, address: String?)
typealias SearchLocation                            =   (coordinates: CLLocationCoordinate2D?, address: String?)

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
