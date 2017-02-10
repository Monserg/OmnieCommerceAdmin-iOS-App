//
//  OrganizationMapShowViewController.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 10.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import MapKit

// MARK: - Input protocols for current ViewController component VIP-cicle
protocol OrganizationMapShowViewControllerInput {
    func displaySomething(viewModel: OrganizationMapShowModels.Something.ViewModel)
}

// MARK: - Output protocols for Interactor component VIP-cicle
protocol OrganizationMapShowViewControllerOutput {
    func doSomething(requestModel: OrganizationMapShowModels.Something.RequestModel)
}

class OrganizationMapShowViewController: UIViewController {
    // MARK: - Properties
    var interactor: OrganizationMapShowViewControllerOutput!
    var router: OrganizationMapShowRouter!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var customNavigationBarView: MainNavigationBarView!

    // MARK: - Class initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        OrganizationMapShowConfigurator.sharedInstance.configure(viewController: self)
    }
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doSomethingOnLoad()
    }
    

    // MARK: - Custom Functions
    func doSomethingOnLoad() {
//        // NOTE: Ask the Interactor to do some work
//        let requestModel = OrganizationMapShowModels.Something.RequestModel()
//        interactor.doSomething(requestModel: requestModel)
        
        // Set left bar button image
        customNavigationBarView.leftButton.setImage(UIImage.init(named: "icon-navbar-back-normal"), for: .normal)
        
        // Handler left bar button
        customNavigationBarView.handlerNavBarLeftButtonCompletion = { _ in
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}


// MARK: - ForgotPasswordShowViewControllerInput
extension OrganizationMapShowViewController: OrganizationMapShowViewControllerInput {
    func displaySomething(viewModel: OrganizationMapShowModels.Something.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
}
