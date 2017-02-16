//
//  SocialNetworkManager.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 16.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import Foundation
import SwiftyVK

enum NetworkType {
    case VK
    case Google
    case Facebook
}

class SocialNetworkManager {
    // MARK: - Properties
    let vkAppID = "5878120"
    let vkScope: Set<VK.Scope> = [.messages, .offline, .friends, .wall, .photos, .audio, .video, .docs, .market, .email]
    
    
    // MARK: - Custom Functions
    init(withNetwork type: NetworkType) {
        switch type {
        case .VK:
            VK.config.logToConsole = true
            VK.configure(withAppId: vkAppID, delegate: self)

        default:
            break
        }
    }
    
    // VK
    func didAuthorizeUser() {
        VK.logOut()
        print("SwiftyVK: LogOut")
        
        VK.logIn()
        print("SwiftyVK: authorize")
    }
    
    func didLogoutUser() {
        VK.logOut()
        print("SwiftyVK: LogOut")
    }
    
    func Validation() {
        VK.API.custom(method: "account.testValidation").send(
            onSuccess: { response in print("SwiftyVK: account.testValidation success \n \(response)") },
            onError: { error in print("SwiftyVK: account.testValidation fail \n \(error)") }
        )
    }
    
    func didLoadUsers() {
        VK.API.Users.get([VK.Arg.userId : "1"]).send(
            onSuccess: { response in print("SwiftyVK: users.get success \n \(response)") },
            onError: { error in print("SwiftyVK: users.get fail \n \(error)") }
        )
    }
}


// MARK: - VKDelegate
extension SocialNetworkManager: VKDelegate {
    // Called when SwiftyVK need authorization permissions
    func vkWillAuthorize() -> Set<VK.Scope> {
        return vkScope
    }
    
    // Called when the user is log in
    // Here you can start to send requests to the API
    func vkDidAuthorizeWith(parameters: Dictionary<String, String>) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "didAuthorizeAppVK"), object: nil)
    }
    
    // Called when user is log out
    func vkDidUnauthorize() {}

    // Called when SwiftyVK could not authorize. To let the application know that something went wrong
    func vkAutorizationFailedWith(error: AuthError) {
        print("Autorization failed with error: \n\(error)")
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "didNotAuthorizeAppVK"), object: nil)
    }

    // Called when SwiftyVK need know where a token is located
    func vkShouldUseTokenPath() -> String? {
        return nil
    }

    // Only for iOS! Called when need to display a view from SwiftyVK
    func vkWillPresentView() -> UIViewController {
        return UIApplication.shared.delegate!.window!!.rootViewController!
    }
}
