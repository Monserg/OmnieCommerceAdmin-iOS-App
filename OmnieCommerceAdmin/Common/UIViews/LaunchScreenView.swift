//
//  LaunchScreenView.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 02.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

class LaunchScreenView: UIView {
    // MARK: - Properties
    @IBOutlet var view: UIView!
    
    
    // MARK: - Class Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createFromXIB()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        createFromXIB()
    }
    
    
    // MARK: - Custom Functions
    func createFromXIB() {
        UINib(nibName: String(describing: LaunchScreenView.self), bundle: Bundle(for: LaunchScreenView.self)).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = frame
    }
}
