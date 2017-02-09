//
//  OrganizationAddInteractor.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 09.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input protocols for current Interactor component VIP-cicle
protocol OrganizationAddInteractorInput {
    func doSomething(requestModel: OrganizationAddModels.Something.RequestModel)
}

// MARK: - Output protocols for Presenter component VIP-cicle
protocol OrganizationAddInteractorOutput {
    func presentSomething(responseModel: OrganizationAddModels.Something.ResponseModel)
}

class OrganizationAddInteractor: OrganizationAddInteractorInput {
    // MARK: - Properties
    var presenter: OrganizationAddInteractorOutput!
    var worker: OrganizationAddWorker!
    
    
    // MARK: - Custom Functions. Business logic
    func doSomething(requestModel: OrganizationAddModels.Something.RequestModel) {
        // NOTE: Create some Worker to do the work
        worker = OrganizationAddWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let responseModel = OrganizationAddModels.Something.ResponseModel()
        presenter.presentSomething(responseModel: responseModel)
    }
}
