//
//  MainShowInteractor.swift
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
protocol MainShowInteractorInput {
    func doSomething(request: MainShow.Something.Request)
}

protocol MainShowInteractorOutput {
    func presentSomething(response: MainShow.Something.Response)
}

class MainShowInteractor: MainShowInteractorInput {
    // MARK: - Properties
    var output: MainShowInteractorOutput!
    var worker: MainShowWorker!
    
    
    // MARK: - Custom Functions. Business logic
    func doSomething(request: MainShow.Something.Request) {
        // NOTE: Create some Worker to do the work
        worker = MainShowWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let response = MainShow.Something.Response()
        output.presentSomething(response: response)
    }
}
