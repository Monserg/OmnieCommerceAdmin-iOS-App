//
//  OrganizationMapShowInteractor.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 10.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input protocols for current Interactor component VIP-cicle
protocol OrganizationMapShowInteractorInput {
    func didLoadLocation(requestModel: OrganizationMapShowModels.Location.RequestModel)
    func didStopUpdateLocation(requestModel: OrganizationMapShowModels.Location.RequestModel)
}

// MARK: - Output protocols for Presenter component VIP-cicle
protocol OrganizationMapShowInteractorOutput {
    func didPrepareToShowLocation(responseModel: OrganizationMapShowModels.Location.ResponseModel)
    func didPrepareToDismissViewController(responseModel: OrganizationMapShowModels.Location.ResponseModel)
}

class OrganizationMapShowInteractor: OrganizationMapShowInteractorInput {
    // MARK: - Properties
    var presenter: OrganizationMapShowInteractorOutput!
    var worker: OrganizationMapShowWorker!
    
    
    // MARK: - Custom Functions. Business logic
    func didLoadLocation(requestModel: OrganizationMapShowModels.Location.RequestModel) {
        requestModel.locationManager.startCoreLocation(withSearchLocation: requestModel.searchLocation)
        
        return requestModel.locationManager.handlerLocationCompletion = { placemark in
            let responseModel = OrganizationMapShowModels.Location.ResponseModel(placemark: placemark)
            self.presenter.didPrepareToShowLocation(responseModel: responseModel)
        }
    }
    
    func didStopUpdateLocation(requestModel: OrganizationMapShowModels.Location.RequestModel) {
        worker = OrganizationMapShowWorker()
        requestModel.locationManager.stopCoreLocation()
        
        let responseModel = OrganizationMapShowModels.Location.ResponseModel(placemark: nil)
        presenter.didPrepareToDismissViewController(responseModel: responseModel)
    }
}
