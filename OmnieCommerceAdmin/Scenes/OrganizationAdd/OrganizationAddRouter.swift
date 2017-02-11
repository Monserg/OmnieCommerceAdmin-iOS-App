//
//  OrganizationAddRouter.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 09.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input & Output protocols
protocol OrganizationAddRouterInput {
    func navigateToMap()
}

class OrganizationAddRouter: OrganizationAddRouterInput {
    // MARK: - Properties
    weak var viewController: OrganizationAddViewController!
    
    
    // MARK: - Custom Functions. Navigation
    func navigateToMap() {
        let storyboard = UIStoryboard(name: "OrganizationMapShow", bundle: nil)
        let organizationMapShowVC = storyboard.instantiateViewController(withIdentifier: "OrganizationMapShowVC") as! OrganizationMapShowViewController
        organizationMapShowVC.organizationName = viewController.textFieldsCollection.first?.text
        
        viewController.navigationController?.pushViewController(organizationMapShowVC, animated: true)
    }
    
    // Communication
    func passDataToNextScene(segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        if segue.identifier == "ShowSomewhereScene" {
            passDataToSomewhereScene(segue: segue)
        }
    }
    
    // Transition
    func passDataToSomewhereScene(segue: UIStoryboardSegue) {
        // NOTE: Teach the router how to pass data to the next scene
        // let someWhereViewController = segue.destinationViewController as! SomeWhereViewController
        // someWhereViewController.output.name = viewController.output.name
    }
}
