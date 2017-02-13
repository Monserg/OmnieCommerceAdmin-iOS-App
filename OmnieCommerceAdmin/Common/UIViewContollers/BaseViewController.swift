//
//  BaseViewController.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 04.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit
import Localize_Swift
import SWRevealViewController

class BaseViewController: UIViewController {
    // MARK: - Properties
    var selectedRange: CGRect?
    var scrollViewBase = UIScrollView()
    var navigationBarView: MainNavigationBarView?
    var blackOutView: UIView?
    
    var haveMenuItem = false {
        didSet {
            didApplySlideMenuSettings()
        }
    }
    
    var textFieldsArray = [CustomTextField]() {
        willSet {
            for textField in newValue {
                textField.delegate = self
            }
        }
    }
    
    
    // MARK: - Class Initialization
    override func awakeFromNib() {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]")
        
        super.awakeFromNib()
    }
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        print(object: "\(type(of: self)): \(#function) run in [line \(#line)]. View size = \(view.bounds.size)")
        
        super.viewDidLoad()
        
        // Setup App background color theme
        view.applyBackgroundTheme()

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
    
    func showNavigationBar(withTitle title: String) {
        if (navigationController?.isNavigationBarHidden == true) {
            navigationController?.isNavigationBarHidden = false
        }
    }
    
    func showAlertView(withTitle title: String, andMessage message: String) {
        let alertViewController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let alertViewControllerAction = UIAlertAction.init(title: "Ok".localized(), style: .default, handler: nil)
        
        alertViewController.addAction(alertViewControllerAction)
        present(alertViewController, animated: true, completion: nil)
    }
    
    func didApplySlideMenuSettings() {
        if (haveMenuItem) {
            // Add Slide Menu actions
            if revealViewController() != nil {
                // Sidebar is width 295
                revealViewController().rearViewRevealWidth = 295
                
                revealViewController().rearViewRevealDisplacement = 198
                
                revealViewController().rearViewRevealOverdraw = 0
                
                // Faster slide animation
                revealViewController().toggleAnimationDuration = 0.3
                
                // Simply ease out. No Spring animation.
                revealViewController().toggleAnimationType = .easeOut
                
                // More shadow
                revealViewController().frontViewShadowRadius = 0
                revealViewController().frontViewShadowColor = UIColor.init(hexString: "#000000", withAlpha: 1.0)
                
                view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
                navigationBarView!.leftButton.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
                
                // Delegate
                revealViewController().delegate = self
            }
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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
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
            let indexCurrent = textFieldsArray.index(of: textField as! CustomTextField)!
            let indexNext = textFieldsArray.index(after: indexCurrent)
            
            textFieldsArray[indexNext].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}


// MARK: - UINavigationControllerDelegate
extension BaseViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().barTintColor = UIColor.veryDarkGray
        UINavigationBar.appearance().tintColor = UIColor.veryLightGray
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.veryLightGray]
        UINavigationBar.appearance().isTranslucent = false
    }
}


// MARK: - SWRevealViewControllerDelegate
extension BaseViewController: SWRevealViewControllerDelegate {
    func revealController(_ revealController: SWRevealViewController!, willMoveTo position: FrontViewPosition) {
        switch position {
        case .right, .rightMost, .rightMostRemoved:
            // Create blackOutView
            blackOutView = UIView.init() //(frame: CGRect.init(x: 0, y: (navigationBarView?.frame.maxY)!, width: view.frame.width, height: view.frame.height - (navigationBarView?.frame.maxY)!))
            blackOutView!.backgroundColor = UIColor.init(hexString: "#000000", withAlpha: 0.2)
            blackOutView!.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(blackOutView!)

            // Add constraints
            let topConstraint       =   NSLayoutConstraint(item: blackOutView!, attribute: .top, relatedBy: .equal,
                                                           toItem: navigationBarView!, attribute: .bottom, multiplier: 1.0, constant: 0.0)
            
            let leftConstraint      =   NSLayoutConstraint(item: blackOutView!, attribute: .left , relatedBy: .equal,
                                                           toItem: view, attribute: .left, multiplier: 1.0, constant: 0.0)
            
            let bottomConstraint    =   NSLayoutConstraint(item: blackOutView!, attribute: .bottom, relatedBy: .equal,
                                                           toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
            
            let rightConstraint     =   NSLayoutConstraint(item: blackOutView!, attribute: .right , relatedBy: .equal,
                                                           toItem: view, attribute: .right, multiplier: 1.0, constant: 0.0)
            
            view.addConstraints([topConstraint, leftConstraint, bottomConstraint, rightConstraint])
            
        default:
            blackOutView!.removeFromSuperview()
        }
    }
}
