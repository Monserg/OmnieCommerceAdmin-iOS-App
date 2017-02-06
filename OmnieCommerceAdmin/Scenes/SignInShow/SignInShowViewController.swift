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

enum AnimationDirection {
    case FromLeftToRight
    case FromRightToLeft
}

class SignInShowViewController: BaseViewController, SignInShowViewControllerInput {
    // MARK: - Properties
    var output: SignInShowViewControllerOutput!
    var router: SignInShowRouter!
    var animationDirection: AnimationDirection?
    
    // Container childVC
    var signInContainerShowVC: SignInContainerShowViewController?
    var signUpShowVC: SignUpShowViewController?
    var forgotPasswordShowVC: ForgotPasswordShowViewController?
    
    var activeViewController: BaseViewController? {
        didSet {
            guard oldValue != nil else {
                router.updateActiveViewController()
                
                return
            }
            
            animationDirection = ((oldValue?.view.tag)! < (activeViewController?.view.tag)!) ? .FromRightToLeft : .FromLeftToRight
            router.removeInactiveViewController(inactiveViewController: oldValue)
        }
    }

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoBackgroundView: UIView!
    @IBOutlet weak var containerStackView: UIStackView!

    
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
        
        // Hide navigation bar
        hideNavigationBar()
        
        // Apply Container childVC
        router.navigateBetweenContainerSubviews()
        
        // Setup App background color theme
        view.applyBackgroundTheme()
        logoBackgroundView.applyBackgroundTheme()
    }
    
    // Display logic
    func displaySomething(viewModel: SignInShow.Something.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
    
    
    // MARK: - Actions
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
