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

// MARK: - Input protocols for current Interactor component VIP-cicle
protocol SignUpShowInteractorInput {
    func didValidatePasswordTextFieldStrength(fromRequestModel requestModel: SignUpShowModels.PasswordTextField.RequestModel)
    func didRegisterUser(fromRequestModel requestModel: SignUpShowModels.User.RequestModel)
}

// MARK: - Output protocols for Presenter component VIP-cicle
protocol SignUpShowInteractorOutput {
    func didPrepareShowPasswordTextFieldResult(fromResponseModel responseModel: SignUpShowModels.PasswordTextField.ResponseModel)
    func didPrepareShowRegisterUserResult(fromResponseModel responseModel: SignUpShowModels.User.ResponseModel)
}

class SignUpShowInteractor: SignUpShowInteractorInput {
    // MARK: - Properties
    var presenter: SignUpShowInteractorOutput!
    var worker: SignUpShowWorker!
    
    
    // MARK: - Custom Functions. Business logic
    func didValidatePasswordTextFieldStrength(fromRequestModel: SignUpShowModels.PasswordTextField.RequestModel) {
        // Check password strength & validation
        worker = SignUpShowWorker()
//        let passwordStrengthResult = worker.checkPasswordStrength(requestModel.password)
//        let responseModel = SignUpShowModels.PasswordTextField.Response(strengthLevel: passwordStrengthResult.strengthLevel!, isValid: passwordStrengthResult.isValid!)
//        
//        presenter.preparePasswordTextFieldResultForShowFrom(responseModel: responseModel)
    }
    
    func didRegisterUser(fromRequestModel requestModel: SignUpShowModels.User.RequestModel) {
        worker = SignUpShowWorker()
        let result = worker.didApplyREST()
        
        // NOTE: Pass the result to the Presenter
        let responseModel = SignUpShowModels.User.ResponseModel(result: result)
        presenter.didPrepareShowRegisterUserResult(fromResponseModel: responseModel)
    }
}
