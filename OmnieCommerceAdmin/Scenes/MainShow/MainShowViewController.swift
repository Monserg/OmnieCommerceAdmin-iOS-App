//
//  MainShowViewController.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 02.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import SWRevealViewController

// MARK: - Input protocols for current ViewController component VIP-cicle
protocol MainShowViewControllerInput {
    func displaySomething(viewModel: MainShow.Something.ViewModel)
}

// MARK: - Output protocols for Interactor component VIP-cicle
protocol MainShowViewControllerOutput {
    func doSomething(request: MainShow.Something.Request)
}

class MainShowViewController: UIViewController, MainShowViewControllerInput {
    // MARK: - Properties
    var interactor: MainShowViewControllerOutput!
    var router: MainShowRouter!
    
    @IBOutlet weak var guestView: UIView!
    @IBOutlet weak var userView: UIView!

    
    // MARK: - Class initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        MainShowConfigurator.sharedInstance.configure(viewController: self)
    }
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doInitialSetupOnLoad()
    }
    

    // MARK: - Custom Functions
    func showBackground() {        
        switch Config.Constants.isUserGuest {
        case true:
            userView.isHidden = true
            guestView.applyBackgroundTheme()
            
        default:
            guestView.isHidden = true
            userView.applyBackgroundTheme()
        }
    }
    
    func doInitialSetupOnLoad() {
        // NOTE: Ask the Interactor to do some work
        let request = MainShow.Something.Request()
        interactor.doSomething(request: request)
        
        showBackground()
        didSetupFirstScene()
    }
    
    // Display logic
    func displaySomething(viewModel: MainShow.Something.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
    
    func didSetupFirstScene() {
//        let isUserGuest = Config.Constants.isUserGuest
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

//        if (isUserGuest) {
            // Initial VC
            let signInShowStoryboard = UIStoryboard(name: "SignInShow", bundle: nil)
            let initialNC = signInShowStoryboard.instantiateViewController(withIdentifier: "SignInShowNC") as! UINavigationController
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                appDelegate.window!.rootViewController = initialNC
                appDelegate.window!.makeKeyAndVisible()
            }
//        } else {
//            // Initial VC
//            let organizationsShowStoryboard = UIStoryboard(name: "SlideMenuShow", bundle: nil)
//            let initialVC = organizationsShowStoryboard.instantiateViewController(withIdentifier: "SWRevealVC") as! SWRevealViewController
//            
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                appDelegate.window!.rootViewController = initialVC
//                appDelegate.window!.makeKeyAndVisible()
//            }
//        }
    }
}
