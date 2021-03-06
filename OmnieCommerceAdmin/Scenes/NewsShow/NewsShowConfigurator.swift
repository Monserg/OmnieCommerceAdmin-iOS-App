//
//  NewsShowConfigurator.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 14.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter
extension NewsShowViewController: NewsShowPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}

extension NewsShowInteractor: NewsShowViewControllerOutput {
}

extension NewsShowPresenter: NewsShowInteractorOutput {
}

class NewsShowConfigurator {
    // MARK: - Properties
    static let sharedInstance = NewsShowConfigurator()
    
    
    // MARK: - Class initialization
    private init() {}
    

    // MARK: - Custom Functions
    func configure(viewController: NewsShowViewController) {
        let router = NewsShowRouter()
        router.viewController = viewController
        
        let presenter = NewsShowPresenter()
        presenter.viewController = viewController
        
        let interactor = NewsShowInteractor()
        interactor.presenter = presenter
        
        viewController.interactor = interactor
        viewController.router = router
    }
}
