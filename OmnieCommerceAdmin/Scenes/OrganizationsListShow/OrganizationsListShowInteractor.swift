//
//  OrganizationsListShowInteractor.swift
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
protocol OrganizationsListShowInteractorInput {
    func doSomething(request: OrganizationsListShow.Something.Request)
}

protocol OrganizationsListShowInteractorOutput {
    func presentSomething(response: OrganizationsListShow.Something.Response)
}

class OrganizationsListShowInteractor: OrganizationsListShowInteractorInput {
    // MARK: - Properties
    var output: OrganizationsListShowInteractorOutput!
    var worker: OrganizationsListShowWorker!
    
    
    // MARK: - Custom Functions. Business logic
    func doSomething(request: OrganizationsListShow.Something.Request) {
        // NOTE: Create some Worker to do the work
        worker = OrganizationsListShowWorker()
        worker.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let response = OrganizationsListShow.Something.Response()
        output.presentSomething(response: response)
    }
}