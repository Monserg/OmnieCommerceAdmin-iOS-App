//
//  MainNavigationBarView.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 09.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

@IBDesignable class MainNavigationBarView: UIView {
    // MARK: - Properties
    var handlerNavBarLeftButtonCompletion: HandlerNavBarLeftButtonCompletion?
    
    @IBInspectable var titleText: String? {
        didSet {
            titleLabel.text = titleText?.localized()
        }
    }

    @IBOutlet var view: UIView!
    @IBOutlet weak var titleLabel: CustomLabel!
    @IBOutlet weak var leftButton: UIButton!
    

    // MARK: - Class Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromXIB()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadViewFromXIB()
    }

    
    // MARK: - Custom Functions
    func loadViewFromXIB() {
        UINib(nibName: String(describing: MainNavigationBarView.self), bundle: Bundle(for: MainNavigationBarView.self)).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = frame
    }
    
    
    // MARK: - Actions
    @IBAction func handlerLeftButtonTap(_ sender: UIButton) {
        handlerNavBarLeftButtonCompletion!()
    }
}
