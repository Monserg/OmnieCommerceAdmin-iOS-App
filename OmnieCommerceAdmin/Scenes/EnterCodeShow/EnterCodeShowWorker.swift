//
//  EnterCodeShowWorker.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 07.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

class EnterCodeShowWorker {
    // MARK: - Custom Functions. Business Logic
    func checkCodes(_ enterCode: String, andInputCode inputCode: String) -> Bool {
        return enterCode == inputCode
    }
    
    func getEnterCode() -> String {
        // TODO: - ADD API
        
        return "3457"
    }
}
