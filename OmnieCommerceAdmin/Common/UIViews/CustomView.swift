//
//  CustomView.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 03.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

enum ViewDesign: String {
    case SingleBottomVeryLightGrayLine = "SingleBottomVeryLightGrayLine"
}

@IBDesignable class CustomView: UIView {
    // MARK: - Properties
    var style: ViewDesign!
    
    @IBInspectable var viewDesign: String? {
        set {
            if let designName = newValue, let viewDesign = ViewDesign(rawValue: designName) {
                style = viewDesign
                setNeedsDisplay()
            }
        }
        
        get { return nil }
    }
    
    
    // MARK: - Class Functions
    override func draw(_ rect: CGRect) {
        switch style! {
        case .SingleBottomVeryLightGrayLine:
            let drawPath = UIBezierPath()
            
            drawPath.move(to: CGPoint.init(x: bounds.minX, y: bounds.maxY))
            drawPath.addLine(to: CGPoint.init(x: bounds.maxX, y: bounds.maxY))
            
            drawPath.lineWidth = 1.0
            let drawPathColor = UIColor(hexString: (Config.Constants.isAppThemesDark) ? "#5e6969" : "#9ec9c6", withAlpha: 1.0)!
            drawPathColor.setStroke()

            drawPath.stroke()
        }
    }
}
