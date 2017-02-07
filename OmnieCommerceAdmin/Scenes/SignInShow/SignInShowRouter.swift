//
//  SignInShowRouter.swift
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
protocol SignInShowRouterInput {
    func navigateToSomewhere()
}

class SignInShowRouter: SignInShowRouterInput {
    // MARK: - Properties
    weak var viewController: SignInShowViewController!
    var translationX: CGFloat?
    
    
    // MARK: - Custom Functions. Navigation
    func navigateBetweenContainerSubviews() {
        // Apply Container childVC
        viewController.signInContainerShowVC = UIStoryboard(name: "SignInShow", bundle: nil).instantiateViewController(withIdentifier: "SignInContainerShowVC") as? SignInContainerShowViewController
        
        viewController.signInContainerShowVC?.handlerRegisterButtonCompletion = { _ in
            self.viewController.signUpShowVC = UIStoryboard(name: "SignInShow", bundle: nil).instantiateViewController(withIdentifier: "SignUpShowVC") as? SignUpShowViewController
            
            self.viewController.signUpShowVC?.handlerCancelButtonCompletion = { _ in
                self.viewController.activeViewController = self.viewController.signInContainerShowVC
            }
            
            self.viewController.activeViewController = self.viewController.signUpShowVC
        }
        
        viewController.signInContainerShowVC?.handlerForgotPasswordButtonCompletion = { _ in
            // Create ForgotPasswordViewController
            self.viewController.forgotPasswordShowVC = UIStoryboard(name: "SignInShow", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordShowVC") as? ForgotPasswordShowViewController
            
//            UIView.animate(withDuration: 0.0) {
//                self.viewController.socialButtonsView.isHidden = true
//            }
            
            // Send button handler
            self.viewController.forgotPasswordShowVC?.handlerSendButtonCompletion = { _ in
                // Create EnterCodeShowViewController
                self.viewController.enterCodeShowViewController = UIStoryboard(name: "SignInShow", bundle: nil).instantiateViewController(withIdentifier: "EnterCodeShowVC") as? EnterCodeShowViewController
                
                // TODO: - ADD ENTER CODE ACTION BUTTONS HANDLERS
                
                self.viewController.activeViewController = self.viewController.enterCodeShowViewController
            }
            
            // Cancel button handler
            self.viewController.forgotPasswordShowVC?.handlerCancelButtonCompletion = { _ in
                self.viewController.activeViewController = self.viewController.signInContainerShowVC
                
                // Show social buttons view
                UIView.animate(withDuration: 0.3) {
                    self.viewController.socialButtonsView.isHidden = false
                }
            }
            
            self.viewController.activeViewController = self.viewController.forgotPasswordShowVC
            
            // Hide social buttons view
            UIView.animate(withDuration: 0.3) {
                self.viewController.socialButtonsView.isHidden = true
            }
        }
        
        viewController.activeViewController = viewController.signInContainerShowVC
    }
    
    // MARK: - UIContainerView
    func removeInactiveViewController(inactiveViewController: BaseViewController?) {
        if let inactiveVC = inactiveViewController {
            translationX = viewController.displaySize.width
            
            UIView.animate(withDuration: 0.2, animations: {
                inactiveVC.view.transform = CGAffineTransform(translationX: (self.viewController.animationDirection == .FromRightToLeft) ? -self.translationX! : self.translationX!, y: 0)
            }, completion: { success in
                inactiveVC.willMove(toParentViewController: nil)
                inactiveVC.view.removeFromSuperview()
                inactiveVC.removeFromParentViewController()
                
                self.updateActiveViewController()
            })
        }
    }
    
    func updateActiveViewController() {
        if let activeVC = viewController.activeViewController {
            if (self.viewController.animationDirection == nil) {
                addActiveViewController(activeVC)
            } else {
                self.addActiveViewController(activeVC)
//                self.translationX = self.viewController.containerStackView.frame.minX - activeVC.
                
                UIView.animate(withDuration: 0.2, animations: {
                    activeVC.view.transform = CGAffineTransform(translationX: (self.viewController.animationDirection == .FromRightToLeft) ? -self.translationX! : 0, y: 0)
                })
            }
        }
    }

    private func addActiveViewController(_ activeVC: BaseViewController) {
        self.viewController.addChildViewController(activeVC)

        if (self.viewController.animationDirection == nil) {
            activeVC.view.frame = self.viewController.containerView.bounds
        } else {
            activeVC.view.frame = CGRect.init(origin: CGPoint.init(x: ((self.viewController.animationDirection == .FromRightToLeft) ? translationX! : -translationX!), y: 0), size: self.viewController.containerView.bounds.size)
        }
        
        self.viewController.containerView.addSubview(activeVC.view)
        activeVC.didMove(toParentViewController: self.viewController)
    }
    
    func navigateToSomewhere() {
        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
        // 1. Trigger a storyboard segue
        // viewController.performSegueWithIdentifier("ShowSomewhereScene", sender: nil)
        
        // 2. Present another view controller programmatically
        // viewController.presentViewController(someWhereViewController, animated: true, completion: nil)
        
        // 3. Ask the navigation controller to push another view controller onto the stack
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
        
        // 4. Present a view controller from a different storyboard
        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
    }
    
    // Communication
    func passDataToNextScene(segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        if segue.identifier == "ShowSomewhereScene" {
            passDataToSomewhereScene(segue: segue)
        }
    }
    
    // Transition
    func passDataToSomewhereScene(segue: UIStoryboardSegue) {
        // NOTE: Teach the router how to pass data to the next scene
        // let someWhereViewController = segue.destinationViewController as! SomeWhereViewController
        // someWhereViewController.output.name = viewController.output.name
    }
}
