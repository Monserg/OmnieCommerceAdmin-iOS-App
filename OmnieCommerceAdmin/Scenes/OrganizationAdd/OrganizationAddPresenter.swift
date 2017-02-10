//
//  OrganizationAddPresenter.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 09.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input protocols for current Presenter component VIP-cicle
protocol OrganizationAddPresenterInput {
    func presentSomething(responseModel: OrganizationAddModels.Something.ResponseModel)
}

// MARK: - Output protocols for ViewController component VIP-cicle
protocol OrganizationAddPresenterOutput: class {
    func displaySomething(viewModel: OrganizationAddModels.Something.ViewModel)
}

class OrganizationAddPresenter: OrganizationAddPresenterInput {
    // MARK: - Properties
    weak var viewController: OrganizationAddPresenterOutput!
    
    
    // MARK: - Custom Functions. Presentation logic
    func presentSomething(responseModel: OrganizationAddModels.Something.ResponseModel) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = OrganizationAddModels.Something.ViewModel()
        viewController.displaySomething(viewModel: viewModel)
    }
}