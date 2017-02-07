//
//  ForgotPasswordShowViewController.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 03.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input protocols for current ViewController component VIP-cicle
protocol ForgotPasswordShowViewControllerInput {
    func displaySomething(viewModel: ForgotPasswordShow.Something.ViewModel)
}

// MARK: - Output protocols for Interactor component VIP-cicle
protocol ForgotPasswordShowViewControllerOutput {
    func doSomething(request: ForgotPasswordShow.Something.Request)
}

class ForgotPasswordShowViewController: BaseViewController {
    // MARK: - Properties
    var interactor: ForgotPasswordShowViewControllerOutput!
    var router: ForgotPasswordShowRouter!
    var handlerSendButtonCompletion: HandlerSendButtonCompletion?
    var handlerCancelButtonCompletion: HandlerCancelButtonCompletion?
    
    @IBOutlet weak var scrollView: UIScrollView!

    
    // MARK: - Class initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ForgotPasswordShowConfigurator.sharedInstance.configure(viewController: self)
    }
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doInitialSetupOnLoad()
    }
    

    // MARK: - Custom Functions
    func doInitialSetupOnLoad() {
        // NOTE: Ask the Interactor to do some work
        let request = ForgotPasswordShow.Something.Request()
        interactor.doSomething(request: request)

        // Setup App background color theme
        view.applyBackgroundTheme()
    }
    
    
    // MARK: - Actions
    @IBAction func handlerSendButtonTap(_ sender: CustomButton) {
        handlerSendButtonCompletion!()
    }
    
    @IBAction func handlerCancelButtonTap(_ sender: CustomButton) {
        handlerCancelButtonCompletion!()
    }
}


// MARK: - ForgotPasswordShowViewControllerInput
extension ForgotPasswordShowViewController: ForgotPasswordShowViewControllerInput {
    func displaySomething(viewModel: ForgotPasswordShow.Something.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
}

