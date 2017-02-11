//
//  OrganizationMapShowPresenter.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 10.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input protocols for current Presenter component VIP-cicle
protocol OrganizationMapShowPresenterInput {
    func presentSomething(responseModel: OrganizationMapShowModels.Forward.ResponseModel)
    func didPrepareToDismissViewController(responseModel: OrganizationMapShowModels.Common.ResponseModel)
}

// MARK: - Output protocols for ViewController component VIP-cicle
protocol OrganizationMapShowPresenterOutput: class {
    func displaySomething(viewModel: OrganizationMapShowModels.Forward.ViewModel)
    func didDismissViewController(viewModel: OrganizationMapShowModels.Common.ViewModel)
}

class OrganizationMapShowPresenter: OrganizationMapShowPresenterInput {
    // MARK: - Properties
    weak var viewController: OrganizationMapShowPresenterOutput!
    
    
    // MARK: - Custom Functions. Presentation logic
    func presentSomething(responseModel: OrganizationMapShowModels.Forward.ResponseModel) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = OrganizationMapShowModels.Forward.ViewModel()
        viewController.displaySomething(viewModel: viewModel)
    }
    
    func didPrepareToDismissViewController(responseModel: OrganizationMapShowModels.Common.ResponseModel) {
        let viewModel = OrganizationMapShowModels.Common.ViewModel()
        viewController.didDismissViewController(viewModel: viewModel)
    }
}