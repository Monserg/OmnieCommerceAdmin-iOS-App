//
//  SignUpShowInteractor.swift
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
protocol SignUpShowInteractorInput {
    func updateTextField(request: SignUpShowModels.UpdateTextField.Request)

    // DEMO
    func doSomething(request: SignUpShowModels.Something.Request)
}

protocol SignUpShowInteractorOutput {
    func presentUpdatedTextField(response: SignUpShowModels.UpdateTextField.Response)

    // DEMO
    func presentSomething(response: SignUpShowModels.Something.Response)
}

class SignUpShowInteractor: SignUpShowInteractorInput {
    // MARK: - Properties
    var output: SignUpShowInteractorOutput!
    var worker: SignUpShowWorker!
    
    
    // MARK: - Custom Functions. Business logic
    func updateTextField(request: SignUpShowModels.UpdateTextField.Request) {
        let response = SignUpShowModels.UpdateTextField.Response(text: request.text)
        
        output.presentUpdatedTextField(response: response)
    }
    
    // DEMO
    func doSomething(request: SignUpShowModels.Something.Request) {
        // NOTE: Create some Worker to do the work
        worker = SignUpShowWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let response = SignUpShowModels.Something.Response()
        output.presentSomething(response: response)
    }
}
