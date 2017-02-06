//
//  UIButton+Extensions.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 04.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

enum ButtonStyle: String {
    case Border                                     =   "Border"
    case TitleUbuntuLight12VeryLightOrange          =   "TitleUbuntuLight12VeryLightOrange"
    case TitleUbuntuLight12UndirlineVeryLightGray   =   "TitleUbuntuLight12UndirlineVeryLightGray"

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
        
        // tag = 99: clear highlighted color
        if (tag != 99) {
            setBackgroundColor()
        }
        
        switch buttonStyle {
        case .Border:
            setTitleColor(UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#5e6969" : "#9ec9c6", withAlpha: 1.0), for: .normal)
            tintColor               =   UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#5e6969" : "#9ec9c6", withAlpha: 1.0)
            layer.borderColor       =   UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#5e6969" : "#9ec9c6", withAlpha: 1.0)?.cgColor
            backgroundColor         =   UIColor.clear
            titleLabel?.font        =   UIFont.ubuntuLight14
            borderWidth             =   1
            layer.cornerRadius      =   bounds.size.height / 2 * ((bounds.size.width == bounds.size.height) ? 1 : 0.75)
            clipsToBounds           =   true
            
        case .TitleUbuntuLight12VeryLightOrange:
            setAttributedTitle(NSAttributedString(string: (titleLabel?.text?.localized())!, attributes: UIFont.ubuntuLight12VeryLightOrange), for: .normal)
            
        case .TitleUbuntuLight12UndirlineVeryLightGray:
            setAttributedTitle(NSAttributedString(string: (titleLabel?.text?.localized())!, attributes: UIFont.ubuntuLight12UnderlineVeryLightGray), for: .normal)
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
