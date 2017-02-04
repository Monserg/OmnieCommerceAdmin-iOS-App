//
//  UIButton+Extensions.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 04.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

enum ButtonStyle: String {
    case Border = "Border"

    //    case Social = "Social"
    //    case Fill = "Fill"
//    case Underline = "Underline"
//    case UnderlineColor = "UnderlineColor"
//    case DropDownList = "DropDownList"
//    case MenuEvent = "MenuEvent"
//    case Circular = "Circular"
//    case ActionViewOrangeButton = "ActionViewOrangeButton"
}

extension UIButton {
    @IBInspectable var buttonStyle: String? {
        set { setupWithStyleNamed(newValue) }
        get { return nil }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    func setupWithStyleNamed(_ named: String?) {
        if let styleName = named, let buttonStyle = ButtonStyle(rawValue: styleName) {
            setupWithStyle(buttonStyle)
        }
    }
    
    func setupWithStyle(_ buttonStyle: ButtonStyle) {
        setTitle(titleLabel?.text?.localized(), for: .normal)
        setTitle(titleLabel?.text?.localized(), for: .highlighted)
        setBackgroundColor()
        
        switch buttonStyle {
        case .Border:
            tintColor           =   (Config.Constants.isAppThemesDark) ? (UIColor(hexString: "#5e6969", withAlpha: 1.0)) : (UIColor(hexString: "#9ec9c6", withAlpha: 1.0))
            layer.borderColor   =   (Config.Constants.isAppThemesDark) ? (UIColor(hexString: "#5e6969", withAlpha: 1.0)?.cgColor) : (UIColor(hexString: "#9ec9c6", withAlpha: 1.0)?.cgColor)
            
            backgroundColor     =   UIColor.clear
            titleLabel?.font    =   UIFont.ubuntuLight14
            layer.cornerRadius  =   frame.size.height / 2
            borderWidth         =   1
        }
    }
    
    func setBackgroundColor() {
        let themeDesign = Config().applyThemeDesign()
        
        switch themeDesign {
        case .LightForUser:
            setBackgroundImage(UIImage(named:"image-background-color-very-light-crey-normal.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
            setBackgroundImage(UIImage(named:"image-background-color-very-light-crey-highlighted.png")?.withRenderingMode(.alwaysOriginal), for: .highlighted)
            
        case .LightForGuest:
            setBackgroundImage(UIImage(named:"image-background-color-dark-cyan-normal.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
            setBackgroundImage(UIImage(named:"image-background-color-dark-cyan-highlighted.png")?.withRenderingMode(.alwaysOriginal), for: .highlighted)
            
        case .DarkForGuest, .DarkForUser:
            setBackgroundImage(UIImage(named:"image-background-color-black-normal.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
            setBackgroundImage(UIImage(named:"image-background-color-black-highlighted.png")?.withRenderingMode(.alwaysOriginal), for: .highlighted)
        }
    }
}
