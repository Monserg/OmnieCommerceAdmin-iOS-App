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

// MARK: - Input protocol for current Interactor
protocol SignUpShowInteractorInput {
    func validatePasswordTextFieldStrengthFrom(requestModel: SignUpShowModels.PasswordTextField.Request)
}

// MARK: - Output protocols for Presenter
protocol SignUpShowInteractorOutput {
    func preparePasswordTextFieldResultForShowFrom(responseModel: SignUpShowModels.PasswordTextField.Response)
}

class SignUpShowInteractor: SignUpShowInteractorInput {
    // MARK: - Properties
    var presenter: SignUpShowInteractorOutput!
    var worker: SignUpShowWorker!
    
    
    // MARK: - Custom Functions. Business logic
    func validatePasswordTextFieldStrengthFrom(requestModel: SignUpShowModels.PasswordTextField.Request) {
        // Check password strength & validation
        worker = SignUpShowWorker()
        let passwordStrengthResult = worker.checkPasswordStrength(requestModel.password)
        let responseModel = SignUpShowModels.PasswordTextField.Response(password: passwordStrengthResult.strength, isValid: passwordStrengthResult.isValid)
        
        presenter.preparePasswordTextFieldResultForShowFrom(responseModel: responseModel)
    }
}
