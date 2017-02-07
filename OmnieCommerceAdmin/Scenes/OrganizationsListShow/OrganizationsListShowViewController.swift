//
//  OrganizationsListShowViewController.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 02.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input protocols for current ViewController component VIP-cicle
protocol OrganizationsListShowViewControllerInput {
    func displaySomething(viewModel: OrganizationsListShow.Something.ViewModel)
}

// MARK: - Output protocols for Interactor component VIP-cicle
protocol OrganizationsListShowViewControllerOutput {
    func doSomething(request: OrganizationsListShow.Something.Request)
}

class OrganizationsListShowViewController: UIViewController, OrganizationsListShowViewControllerInput {
    // MARK: - Properties
    var interactor: OrganizationsListShowViewControllerOutput!
    var router: OrganizationsListShowRouter!
    

    // MARK: - Class initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        OrganizationsListShowConfigurator.sharedInstance.configure(viewController: self)
    }
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doInitialSetupOnLoad()
    }
    

    // MARK: - Custom Functions
    func doInitialSetupOnLoad() {
        // NOTE: Ask the Interactor to do some work
        let request = OrganizationsListShow.Something.Request()
        interactor.doSomething(request: request)
        
        // Setup App background color theme
        view.applyBackgroundTheme()
    }
    
    // Display logic
    func displaySomething(viewModel: OrganizationsListShow.Something.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
}
