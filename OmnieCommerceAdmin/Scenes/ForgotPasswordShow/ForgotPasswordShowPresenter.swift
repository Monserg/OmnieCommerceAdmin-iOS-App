//
//  ForgotPasswordShowPresenter.swift
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
protocol ForgotPasswordShowPresenterInput {
    func presentSomething(response: ForgotPasswordShow.Something.Response)
}

protocol ForgotPasswordShowPresenterOutput: class {
    func displaySomething(viewModel: ForgotPasswordShow.Something.ViewModel)
}

class ForgotPasswordShowPresenter: ForgotPasswordShowPresenterInput {
    // MARK: - Properties
    weak var output: ForgotPasswordShowPresenterOutput!
    
    
    // MARK: - Custom Functions. Presentation logic
    func presentSomething(response: ForgotPasswordShow.Something.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ForgotPasswordShow.Something.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}