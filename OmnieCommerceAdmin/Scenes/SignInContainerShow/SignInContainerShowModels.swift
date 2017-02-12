//
//  SignInContainerShowModels.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 04.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Data models
struct SignInContainerShowModels {
    struct User {
        struct RequestModel {
            let name: String
            let password: String
        }
        
        struct ResponseModel {
            let result: ResponseAPI
        }
        
        struct ViewModel {
            let result: ResponseAPI
        }
    }
}
