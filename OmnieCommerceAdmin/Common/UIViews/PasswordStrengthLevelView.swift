//
//  PasswordStrengthLevelView.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 06.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

class PasswordStrengthLevelView: UIView {
    // MARK: - Properties
    let lineWidth: CGFloat = 1.0
    var passwordStrengthLevel: PasswordStrengthLevel?
    var passwordString: String?
    
    // MARK: - Class Functions
    override func draw(_ rect: CGRect) {
        guard passwordStrengthLevel != nil && passwordString != nil else {
            let oldPath = UIBezierPath()
            oldPath.removeAllPoints()
            
            return
        }
        
        switch passwordStrengthLevel! {
        case .Weak:
            // Draw level line
            let weakLevelLinePath = UIBezierPath()
            weakLevelLinePath.lineWidth = lineWidth

            weakLevelLinePath.move(to: CGPoint.init(x: bounds.minX, y: bounds.maxY))
            weakLevelLinePath.addLine(to: CGPoint.init(x: bounds.maxX / 3, y: bounds.maxY))
            let weakLevelLinePathColor = UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#ae5454" : "862d2d", withAlpha: 1.0)!
            weakLevelLinePathColor.setStroke()
            weakLevelLinePath.stroke()

            // Draw background line
            let weakBackgroundLinePath = UIBezierPath()
            weakBackgroundLinePath.lineWidth = lineWidth

            weakBackgroundLinePath.move(to: CGPoint.init(x: bounds.maxX / 3, y: bounds.maxY))
            weakBackgroundLinePath.addLine(to: CGPoint.init(x: bounds.maxX, y: bounds.maxY))
            let weakBackgroundLinePathColor = UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#5e6969" : "9ec9c6", withAlpha: 1.0)!
            weakBackgroundLinePathColor.setStroke()
            weakBackgroundLinePath.stroke()
            
        case .Reasonable:
            // Draw level line
            let reasonableLevelLinePath = UIBezierPath()
            reasonableLevelLinePath.lineWidth = lineWidth

            reasonableLevelLinePath.move(to: CGPoint.init(x: bounds.minX, y: bounds.maxY))
            reasonableLevelLinePath.addLine(to: CGPoint.init(x: bounds.maxX / 3 * 2, y: bounds.maxY))
            let reasonableLevelLinePathColor = UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#d7b278" : "d7b278", withAlpha: 1.0)!
            reasonableLevelLinePathColor.setStroke()
            reasonableLevelLinePath.stroke()

            // Draw background line
            let weakBackgroundLinePath = UIBezierPath()
            weakBackgroundLinePath.lineWidth = lineWidth

            weakBackgroundLinePath.move(to: CGPoint.init(x: bounds.maxX / 3 * 2, y: bounds.maxY))
            weakBackgroundLinePath.addLine(to: CGPoint.init(x: bounds.maxX, y: bounds.maxY))
            let weakBackgroundLinePathColor = UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#5e6969" : "9ec9c6lkj", withAlpha: 1.0)!
            weakBackgroundLinePathColor.setStroke()
            weakBackgroundLinePath.stroke()
            
        case .Strong:
            // Draw level line
            let strongLevelLinePath = UIBezierPath()
            strongLevelLinePath.lineWidth = lineWidth

            strongLevelLinePath.move(to: CGPoint.init(x: bounds.minX, y: bounds.maxY))
            strongLevelLinePath.addLine(to: CGPoint.init(x: bounds.maxX, y: bounds.maxY))
            let strongLevelLinePathColor = UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#3f916d" : "157f51", withAlpha: 1.0)!
            strongLevelLinePathColor.setStroke()
            strongLevelLinePath.stroke()
        }
    }
}
