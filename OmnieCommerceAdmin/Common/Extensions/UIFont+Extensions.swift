//
//  UIFont+Extensions.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 02.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

extension UIFont {
    // Ubuntu
    open class var ubuntuLight09: UIFont {
        set {
            self.ubuntuLight09 = UIFont(name: "Ubuntu-Light", size: 9.0)!
        }
        
        get {
            return UIFont(name: "Ubuntu-Light", size: 9.0)!
        }
    }
    
    open class var ubuntuLight12: UIFont {
        set {
            self.ubuntuLight12 = UIFont(name: "Ubuntu-Light", size: 12.0)!
        }
        
        get {
            return UIFont(name: "Ubuntu-Light", size: 12.0)!
        }
    }

    open class var ubuntuLight14: UIFont {
        set {
            self.ubuntuLight14 = UIFont(name: "Ubuntu-Light", size: 14.0)!
        }
        
        get {
            return UIFont(name: "Ubuntu-Light", size: 14.0)!
        }
    }
    
    open class var ubuntuLightItalic12: UIFont {
        set {
            self.ubuntuLightItalic12 = UIFont(name: "Ubuntu-LightItalic", size: 12.0)!
        }
        
        get {
            return UIFont(name: "Ubuntu-LightItalic", size: 12.0)!
        }
    }

    
    // HelveticaNeueCyr
    open class var helveticaNeueCyrLight15: UIFont {
        set {
            self.helveticaNeueCyrLight15 = UIFont(name: "helveticaNeueCyr-Light", size: 15.0)!
        }
        
        get {
            return UIFont(name: "helveticaNeueCyr-Light", size: 15.0)!
        }
    }

    open class var helveticaNeueCyrThin47: UIFont {
        set {
            self.helveticaNeueCyrThin47 = UIFont(name: "helveticaNeueCyr-Thin", size: 47.0)!
        }
        
        get {
            return UIFont(name: "helveticaNeueCyr-Thin", size: 47.0)!
        }
    }

    
    // Attributed string
    open class var ubuntuLight12UnderlineVeryLightGray: [String : Any] {
        set {
            self.ubuntuLight12UnderlineVeryLightGray        =   [   NSFontAttributeName             :   UIFont.ubuntuLight12,
                                                                    NSForegroundColorAttributeName  :   UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#5e6969" : "#9ec9c6", withAlpha: 1.0)!,
                                                                    NSKernAttributeName             :   0.0,
                                                                    NSUnderlineStyleAttributeName   :   NSUnderlineStyle.styleSingle.rawValue
                                                                ] as [String : Any]!
        }
        
        get {
            return  [   NSFontAttributeName             :   UIFont.ubuntuLight12,
                        NSForegroundColorAttributeName  :   UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#5e6969" : "#9ec9c6", withAlpha: 1.0)!,
                        NSKernAttributeName             :   0.0,
                        NSUnderlineStyleAttributeName   :   NSUnderlineStyle.styleSingle.rawValue
                    ] as [String : Any]!
        }
    }

    open class var ubuntuLight12VeryLightOrange: [String : Any] {
        set {
            self.ubuntuLight12VeryLightOrange               =   [   NSFontAttributeName             :   UIFont.ubuntuLight12,
                                                                    NSForegroundColorAttributeName  :   UIColor(hexString: "#ffd76c", withAlpha: 1.0)!,
                                                                    NSKernAttributeName             :   0.0,
                                                                    NSUnderlineStyleAttributeName   :   NSUnderlineStyle.styleNone.rawValue
                                                                ] as [String : Any]!
        }
        
        get {
            return  [   NSFontAttributeName             :   UIFont.ubuntuLight12,
                        NSForegroundColorAttributeName  :   UIColor(hexString: "#ffd76c", withAlpha: 1.0)!,
                        NSKernAttributeName             :   0.0,
                        NSUnderlineStyleAttributeName   :   NSUnderlineStyle.styleNone.rawValue
                    ] as [String : Any]!
        }
    }
}
