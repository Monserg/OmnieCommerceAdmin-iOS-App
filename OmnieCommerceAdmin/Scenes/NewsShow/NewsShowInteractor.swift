//
//  NewsShowInteractor.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 14.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input protocols for current Interactor component VIP-cicle
protocol NewsShowInteractorInput {
    func doSomething(requestModel: NewsShowModels.Something.RequestModel)
}

// MARK: - Output protocols for Presenter component VIP-cicle
protocol NewsShowInteractorOutput {
    func presentSomething(responseModel: NewsShowModels.Something.ResponseModel)
}

class NewsShowInteractor: NewsShowInteractorInput {
    // MARK: - Properties
    var presenter: NewsShowInteractorOutput!
    var worker: NewsShowWorker!
    
    
    // MARK: - Custom Functions. Business logic
    func doSomething(requestModel: NewsShowModels.Something.RequestModel) {
        // NOTE: Create some Worker to do the work
        worker = NewsShowWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let responseModel = NewsShowModels.Something.ResponseModel()
        presenter.presentSomething(responseModel: responseModel)
    }
}