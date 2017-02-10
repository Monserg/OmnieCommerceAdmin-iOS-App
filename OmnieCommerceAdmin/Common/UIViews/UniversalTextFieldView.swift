//
//  UniversalTextFieldView.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 10.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

@IBDesignable class UniversalTextFieldView: UIView {
    // MARK: - Properties
    var isExpanded: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.5) {
                self.contentViewHeightConstraint.constant = (self.isExpanded) ? (self.passwordStrengthView.frame.maxY + self.errorMessageView.frame.height) : self.passwordStrengthView.frame.maxY
                self.view?.layoutIfNeeded()
            }
        }
    }

    @IBInspectable var errorMessage: String = "Enter message" {
        didSet {
            errorMessageLabel.text = errorMessage
//            self.contentViewHeightConstraint.constant = (errorMessage.isEmpty) ? self.view.frame.height : self.
        }
    }
    
    @IBInspectable var styleName: String?  {
        didSet {
            customTextField.fieldStyle = styleName
            self.passwordStrengthView.isVisible = (styleName?.contains("Password"))! ? true : false
            self.passwordStrengthViewTopConstraint.constant = (self.passwordStrengthView.isVisible) ? 0 : -self.passwordStrengthView.frame.height
        }
    }

    @IBInspectable var placeholderText: String?  {
        didSet {
            customTextField.placeholder = placeholderText
        }
    }

    @IBOutlet weak var customTextField: CustomTextField! {
        didSet {
            customTextField.delegate = self
        }
    }

    @IBOutlet var view: UIView!
    @IBOutlet weak var errorMessageView: UIView!
    @IBOutlet weak var errorMessageLabel: CustomLabel!
    @IBOutlet weak var passwordStrengthView: PasswordStrengthLevelView!
    
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordStrengthViewTopConstraint: NSLayoutConstraint!
    
    // MARK: - Class Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromXIB()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadViewFromXIB()
    }
    
    
    // MARK: - Custom Functions
    func loadViewFromXIB() {
        UINib(nibName: String(describing: UniversalTextFieldView.self), bundle: Bundle(for: UniversalTextFieldView.self)).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = frame
    }

    
    // MARK: - Class Functions
    override func draw(_ rect: CGRect) {
        // Update Password Strength Level view
        if (passwordStrengthView.isVisible) {
            passwordStrengthView.setNeedsDisplay()
        }
    }
    
    
    // MARK: - Custom Functions
    
}


// MARK: - UITextFieldDelegate
extension UniversalTextFieldView: UITextFieldDelegate {
    // TextField become first responder
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    // // TextField resign first responder
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    // Add validation to TextField
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    
    // Clear button tap
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }
    
    // Hide keyboard
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    
    // TextField editing
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true;
    }
    
    // Return button tap
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
