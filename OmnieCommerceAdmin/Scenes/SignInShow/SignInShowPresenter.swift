//
//  SignInShowPresenter.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 03.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input protocols for current Presenter component VIP-cicle
protocol SignInShowPresenterInput {
    func presentSomething(response: SignInShow.Something.Response)
}

// MARK: - Output protocols for ViewController component VIP-cicle
protocol SignInShowPresenterOutput: class {
    func displaySomething(viewModel: SignInShow.Something.ViewModel)
}

class SignInShowPresenter: SignInShowPresenterInput {
    // MARK: - Properties
    weak var viewController: SignInShowPresenterOutput!
    
    
    // MARK: - Custom Functions. Presentation logic
    func presentSomething(response: SignInShow.Something.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SignInShow.Something.ViewModel()
        viewController.displaySomething(viewModel: viewModel)
    }
}
