//
//  CustomStoriboardSegue.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 04.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

class CustomStoriboardSegue: UIStoryboardSegue {
    // MARK: - Class Functions
    override func perform() {
        let selfViewController = self.source
        
        selfViewController.navigationController?.pushViewController(self.destination, animated: false)
        let transitionView = selfViewController.navigationController?.view
        
        UIView.transition(with: transitionView!, duration: 1, options: .transitionCrossDissolve, animations: { () -> Void in
            print("animations")
        }) { (success) -> Void in
            print("success = \(success)")
        }
    }
}
