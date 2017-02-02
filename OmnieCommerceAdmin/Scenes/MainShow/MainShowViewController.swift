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

// MARK: - Input & Output protocols
protocol MainShowViewControllerInput {
    func displaySomething(viewModel: MainShow.Something.ViewModel)
}

protocol MainShowViewControllerOutput {
    func doSomething(request: MainShow.Something.Request)
}

class MainShowViewController: UIViewController, MainShowViewControllerInput {
    // MARK: - Properties
    var output: MainShowViewControllerOutput!
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
        
        doSomethingOnLoad()
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
    
    func doSomethingOnLoad() {
        // NOTE: Ask the Interactor to do some work
        let request = MainShow.Something.Request()
        output.doSomething(request: request)
        
        showBackground()
    }
    
    // Display logic
    func displaySomething(viewModel: MainShow.Something.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
}
