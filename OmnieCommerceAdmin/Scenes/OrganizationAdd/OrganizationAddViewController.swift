//
//  OrganizationAddViewController.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 09.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input protocols for current ViewController component VIP-cicle
protocol OrganizationAddViewControllerInput {
    func displaySomething(viewModel: OrganizationAddModels.Something.ViewModel)
}

// MARK: - Output protocols for Interactor component VIP-cicle
protocol OrganizationAddViewControllerOutput {
    func doSomething(requestModel: OrganizationAddModels.Something.RequestModel)
}

class OrganizationAddViewController: BaseViewController {
    // MARK: - Properties
    var interactor: OrganizationAddViewControllerOutput!
    var router: OrganizationAddRouter!
//    var leftButtonImage: UIImage!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var customNavigationBarView: MainNavigationBarView!

    
    
    // MARK: - Class initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        OrganizationAddConfigurator.sharedInstance.configure(viewController: self)
    }
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doInitialSetupOnLoad()
    }
    

    // MARK: - Custom Functions
    func doInitialSetupOnLoad() {
        // NOTE: Ask the Interactor to do some work
        let requestModel = OrganizationAddModels.Something.RequestModel()
        interactor.doSomething(requestModel: requestModel)
        
        // Set left bar button image
        customNavigationBarView.leftButton.setImage(UIImage.init(named: "icon-navbar-back-normal"), for: .normal)
        
        // Handler left bar button
        customNavigationBarView.handlerNavBarLeftButtonCompletion = { _ in
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    // MARK: - Actions
    @IBAction func handlerRegisterButtonTap(_ sender: CustomButton) {
    }
    
    @IBAction func handlerCancelButtonTap(_ sender: CustomButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}


// MARK: - OrganizationAddViewControllerInput
extension OrganizationAddViewController: OrganizationAddViewControllerInput {
    func displaySomething(viewModel: OrganizationAddModels.Something.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
}
