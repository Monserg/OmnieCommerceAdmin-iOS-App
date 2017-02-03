//
//  SignUpShowViewController.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 03.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input & Output protocols
protocol SignUpShowViewControllerInput {
    func displaySomething(viewModel: SignUpShow.Something.ViewModel)
}

protocol SignUpShowViewControllerOutput {
    func doSomething(request: SignUpShow.Something.Request)
}

class SignUpShowViewController: UIViewController, SignUpShowViewControllerInput {
    // MARK: - Properties
    var output: SignUpShowViewControllerOutput!
    var router: SignUpShowRouter!
    

    // MARK: - Class initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        SignUpShowConfigurator.sharedInstance.configure(viewController: self)
    }
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doSomethingOnLoad()
    }
    

    // MARK: - Custom Functions
    func doSomethingOnLoad() {
        // NOTE: Ask the Interactor to do some work
        let request = SignUpShow.Something.Request()
        output.doSomething(request: request)
    }
    
    // Display logic
    func displaySomething(viewModel: SignUpShow.Something.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
}