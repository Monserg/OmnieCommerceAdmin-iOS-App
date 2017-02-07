//
//  CustomLabel.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 02.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit


@IBDesignable class CustomLabel: UILabel {
    // MARK: - Class Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    // MARK: - Class Functions
//    override func draw(_ rect: CGRect) {
//        adjustsFontSizeToFitWidth = true
//    }
//    
//    
//    // MARK: - Custom Functions
//    func setup() {
//        NotificationCenter.default.addObserver(self, selector: #selector(applyDeviceRotation), name: .UIDeviceOrientationDidChange, object: nil)
//    }
//    
//    func applyDeviceRotation() {
//        setNeedsDisplay()
//    }
}
