//
//  BaseViewController.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 04.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit
import Localize_Swift
//import SWRevealViewController

class BaseViewController: UIViewController {
    // MARK: - Properties
    var selectedRange: CGRect?
    var scrollViewBase = UIScrollView()
    var textFieldsArray = [CustomTextField]()
    
    var displaySize: CGSize = UIScreen.main.bounds.size
    
    
    // MARK: - Class Initialization
    override func awakeFromNib() {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]")
        
        super.awakeFromNib()
    }
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]. View size = \(view.bounds.size)")
        
        super.viewDidLoad()
        
        // Add Observers
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardAction), name: .UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardAction), name: .UIKeyboardWillChangeFrame, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]")
        
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]")
        
        super.viewDidAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]")
        
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]")
    }
    
    
    // MARK: - Custom Functions
    func releasePrint(object: Any) {
        Swift.print(object)
    }
    
    func print(object: Any) {
        #if DEBUG
            Swift.print(object)
        #endif
    }
    
    func hideNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    func showNavigationBar() {
        if (navigationController?.isNavigationBarHidden == true) {
            navigationController?.isNavigationBarHidden = false
        }
    }
    
    
    // MARK: - Actions
    func handleKeyboardAction(notification: Notification) {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]")
        
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if (notification.name == .UIKeyboardWillHide) {
            scrollViewBase.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            scrollViewBase.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height + 10, right: 0)
        }
        
        guard (selectedRange != nil && (keyboardViewEndFrame.contains((selectedRange?.origin)!))) else {
            self.scrollViewBase.contentOffset.y = 0
            
            return
        }
        
        scrollViewBase.scrollRectToVisible(selectedRange!, animated: true)
    }
    
    
    // MARK: - Transition
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print(object: "\(type(of: self)): \(#function) run. New size = \(size)")
        
        view.endEditing(true)
        displaySize = size
    }
}


// MARK: - UIScrollViewDelegate
extension BaseViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]. UIScrollView.contentOffset.y = \(scrollView.contentOffset.y)")
    }
}


// MARK: - UIGestureRecognizerDelegate
extension BaseViewController: UIGestureRecognizerDelegate {
    func handleTap(gestureRecognizer: UIGestureRecognizer) {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]")
        
        view.endEditing(true)
    }
}


// MARK: - UITextFieldDelegate
extension BaseViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
////        if (textField.tag == 99) {
////            handlerUpdateTextFieldCompletion!(textField.text! + string)
////        }
//        
//        return true
//    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]")
        
        (textField as! CustomTextField).attributedPlaceholderString = textField.attributedPlaceholder
        textField.placeholder = nil
        selectedRange = textField.convert(textField.bounds, to: view)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]")
        
        textField.attributedPlaceholder = (textField as! CustomTextField).attributedPlaceholderString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]")
        
        if (textField.tag != 99) {
            let indexCurrent    =   textFieldsArray.index(of: textField as! CustomTextField)!
            let indexNext       =   textFieldsArray.index(after: indexCurrent)
            
            textFieldsArray[indexNext].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
