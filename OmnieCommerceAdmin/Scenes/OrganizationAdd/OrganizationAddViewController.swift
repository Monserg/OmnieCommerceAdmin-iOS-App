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
    @IBOutlet var textFieldsCollection: [CustomTextField]!
    @IBOutlet weak var emailErrorMessageView: ErrorMessageView!
    @IBOutlet weak var phoneErrorMessageView: ErrorMessageView!

    
    
    @IBOutlet weak var emailErrorMessageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailErrorMessageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneErrorMessageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneErrorMessageViewTopConstraint: NSLayoutConstraint!
    
    
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
        
        // UITextFields
        textFieldsArray = textFieldsCollection
        
        // Apply keyboard handler
        scrollViewBase = scrollView

        // Hide email & phone error message views
        emailErrorMessageViewHeightConstraint.constant = Config.Constants.errorMessageViewHeight
        emailErrorMessageViewTopConstraint.constant = -Config.Constants.errorMessageViewHeight
        phoneErrorMessageViewHeightConstraint.constant = Config.Constants.errorMessageViewHeight
        phoneErrorMessageViewTopConstraint.constant = -Config.Constants.errorMessageViewHeight

        // Handler left bar button
        customNavigationBarView.handlerNavBarLeftButtonCompletion = { _ in
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    // MARK: - Actions
    @IBAction func handlerAvatarButtonTap(_ sender: UIButton) {
    }
    
    @IBAction func handlerLocationButtonTap(_ sender: CustomButton) {
        router.navigateToMap()
    }
    
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


// MARK: - UITextFieldDelegate
extension OrganizationAddViewController {
    // TextField become first responder
    override func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    // // TextField resign first responder
    override func textFieldDidEndEditing(_ textField: UITextField) {
        // Email
        if (textField.tag == 1) {
            if (!(textField as! CustomTextField).checkEmailValidation(textField.text!)) {
                emailErrorMessageView.didShow(true, withConstraint: emailErrorMessageViewTopConstraint)
            } else {
                emailErrorMessageView.didShow(false, withConstraint: emailErrorMessageViewTopConstraint)
            }
        }
        
        // Phone
        if (textField.tag == 2) {
            if (!(textField as! CustomTextField).checkPhoneValidation(textField.text!)) {
                phoneErrorMessageView.didShow(true, withConstraint: phoneErrorMessageViewTopConstraint)
            } else {
                phoneErrorMessageView.didShow(false, withConstraint: phoneErrorMessageViewTopConstraint)
            }
        }
    }
    
    // Add validation to TextField
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    
    // Hide keyboard
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    
    // TextField editing
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Email
        if (textField.tag == 1) {
            emailErrorMessageView.didShow(false, withConstraint: emailErrorMessageViewTopConstraint)
        }
        
        // Phone
        if (textField.tag == 2) {
            phoneErrorMessageView.didShow(false, withConstraint: phoneErrorMessageViewTopConstraint)
            
            if (string.isEmpty) {
                return true
            }
            
            guard Int(string) != nil || ((textField.text?.isEmpty)! && string == "+") else {
                return false
            }
        }
        
        return true
    }
    
    // Clear button tap
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // Email
        if (textField.tag == 1) {
            emailErrorMessageView.didShow(false, withConstraint: emailErrorMessageViewTopConstraint)
        }
        
        // Phone
        if (textField.tag == 2) {
            phoneErrorMessageView.didShow(false, withConstraint: phoneErrorMessageViewTopConstraint)
        }
        
        return true
    }
    
    // Return button tap
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Email
        if (textField.tag == 1) {
            if (!(textField as! CustomTextField).checkEmailValidation(textField.text!)) {
                emailErrorMessageView.didShow(true, withConstraint: emailErrorMessageViewTopConstraint)
                
                return false
            } else {
                emailErrorMessageView.didShow(false, withConstraint: emailErrorMessageViewTopConstraint)
            }
        }
        
        // Phone
        if (textField.tag == 2) {
            if (!(textField as! CustomTextField).checkPhoneValidation(textField.text!)) {
                phoneErrorMessageView.didShow(true, withConstraint: phoneErrorMessageViewTopConstraint)
                
                return false
            } else {
                phoneErrorMessageView.didShow(false, withConstraint: phoneErrorMessageViewTopConstraint)
            }
        }
        
        if (textField.tag == 99) {
                textField.resignFirstResponder()
        } else {
            let indexCurrent = textFieldsArray.index(of: textField as! CustomTextField)!
            let indexNext = textFieldsArray.index(after: indexCurrent)
            
            textFieldsArray[indexNext].becomeFirstResponder()
        }
        
        return true
    }
}

