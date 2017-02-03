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

}
