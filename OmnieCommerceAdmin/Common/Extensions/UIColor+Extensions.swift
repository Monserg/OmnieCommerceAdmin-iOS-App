//
//  UIColor+Extensions.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 02.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init?(hexString: String, withAlpha alpha: CGFloat) {
        let redColor, greenColor, blueColor: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = hexString.substring(from: start)
            
            if hexColor.characters.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt32 = 0
                
                if scanner.scanHexInt32(&hexNumber) {
                    redColor = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    greenColor = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    blueColor = CGFloat(hexNumber & 0x0000ff) / 255
                    
                    self.init(red: redColor, green: greenColor, blue: blueColor, alpha: alpha)
                    
                    return
                }
            }
        }
        
        return nil
    }
    
    open class var veryDarkGray: UIColor {
        set {
            self.veryDarkGray = UIColor(hexString: "#333333", withAlpha: 1.0)!
        }
        
        get {
            return UIColor(hexString: "#333333", withAlpha: 1.0)!
        }
    }
    
    open class var veryLightGray: UIColor {
        set {
            self.veryLightGray = UIColor(hexString: "#dedede", withAlpha: 1.0)!
        }
        
        get {
            return UIColor(hexString: "#dedede", withAlpha: 1.0)!
        }
    }
}
