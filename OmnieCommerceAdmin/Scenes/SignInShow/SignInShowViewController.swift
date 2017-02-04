//
//  SignInShowViewController.swift
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
protocol SignInShowViewControllerInput {
    func displaySomething(viewModel: SignInShow.Something.ViewModel)
}

protocol SignInShowViewControllerOutput {
    func doSomething(request: SignInShow.Something.Request)
}

class SignInShowViewController: BaseViewController, SignInShowViewControllerInput {
    // MARK: - Properties
    var output: SignInShowViewControllerOutput!
    var router: SignInShowRouter!
    
    // Container childVC
    var signInContainerShowVC: SignInContainerShowViewController?
    
    private var activeViewController: BaseViewController? {
        didSet {
            removeInactiveViewController(inactiveViewController: oldValue)
            updateActiveViewController()
        }
    }

    @IBOutlet weak var containerView: UIView!

    
    // MARK: - Class initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        SignInShowConfigurator.sharedInstance.configure(viewController: self)
    }
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doInitialSetupOnLoad()
    }
    

    // MARK: - Custom Functions
    func doInitialSetupOnLoad() {
        // NOTE: Ask the Interactor to do some work
        let request = SignInShow.Something.Request()
        output.doSomething(request: request)
        
        // Apply Container childVC
        signInContainerShowVC       =   UIStoryboard(name: "SignInShow", bundle: nil).instantiateViewController(withIdentifier: "SignInContainerShowVC") as? SignInContainerShowViewController
        
        activeViewController        =   signInContainerShowVC
        
        // Setup App background color theme
        view.applyBackgroundTheme()
    }
    
    // Display logic
    func displaySomething(viewModel: SignInShow.Something.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
    
    
    // MARK: - UIContainerView
    func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inactiveVC = inactiveViewController {
            inactiveVC.willMove(toParentViewController: nil)
            inactiveVC.view.removeFromSuperview()
            inactiveVC.removeFromParentViewController()
        }
    }
    
    func updateActiveViewController() {
        if let activeVC = activeViewController {
            addChildViewController(activeVC)
            activeVC.view.frame = containerView.bounds
            containerView.addSubview(activeVC.view)
            activeVC.didMove(toParentViewController: self)
            activeVC.didMove(toParentViewController: self)
        }
    }

    
    // MARK: - Actions
    @IBAction func handlerRegisterButtonTap(_ sender: CustomButton) {
        print(object: "\(type(of: self)): \(#function) run. Register button tap.")
    }
    
    @IBAction func handlerForgotPasswordButtonTap(_ sender: CustomButton) {
        print(object: "\(type(of: self)): \(#function) run. Forgot Password button tap.")
    }
    
    @IBAction func handlerSignInButtonTap(_ sender: CustomButton) {
        print(object: "\(type(of: self)): \(#function) run. Sign In button tap.")
    }
    
    @IBAction func handlerVkButtonTap(_ sender: CustomButton) {
        print(object: "\(type(of: self)): \(#function) run. Vk button tap.")
    }
    
    @IBAction func handlerGoogleButtonTap(_ sender: CustomButton) {
        print(object: "\(type(of: self)): \(#function) run. Google button tap.")
    }
    
    @IBAction func handlerFbButtonTap(_ sender: CustomButton) {
        print(object: "\(type(of: self)): \(#function) run. Facebook button tap.")
    }
    
    
    // MARK: - Gesture
    @IBAction func handlerTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
