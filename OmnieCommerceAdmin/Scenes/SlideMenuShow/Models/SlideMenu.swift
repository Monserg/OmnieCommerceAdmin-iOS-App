//
//  SlideMenu.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 13.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

struct SlideMenu {
    struct Item  {
        // MARK: - Properties
        let title: String!
        let imageName: String!
        let newPushCount: Int?
        let isColor: Bool!
    }
    
    struct Items {
        // MARK: - Properties
        var sections = Array<Array<SlideMenu.Item>>()
        
        
        // MARK: - Functions
        mutating func didCreate() {
            var sectionRows = Array<SlideMenu.Item>()
            
            for i in 0...3 {
                switch i {
                case 0:
                    let organizations   =   SlideMenu.Item.init(title: "Organizations".localized(), imageName: "icon-menu-organizations-normal", newPushCount: nil, isColor: false)
                    let services        =   SlideMenu.Item.init(title: "Services".localized(), imageName: "icon-menu-services-normal", newPushCount: nil, isColor: false)
                    let orders          =   SlideMenu.Item.init(title: "Orders".localized(), imageName: "icon-menu-orders-normal", newPushCount: nil, isColor: false)
                    let messages        =   SlideMenu.Item.init(title: "Messages".localized(), imageName: "icon-menu-messages-normal", newPushCount: 0, isColor: false)
                    let news            =   SlideMenu.Item.init(title: "News".localized(), imageName: "icon-menu-news-normal", newPushCount: nil, isColor: false)
                    let management      =   SlideMenu.Item.init(title: "Management Resources".localized(), imageName: "icon-menu-management-resources-normal", newPushCount: nil, isColor: false)
                    let statistics      =   SlideMenu.Item.init(title: "Statistics".localized(), imageName: "icon-menu-statistics-normal", newPushCount: nil, isColor: false)
                    let discounts       =   SlideMenu.Item.init(title: "Discounts".localized(), imageName: "icon-menu-discounts-normal", newPushCount: nil, isColor: false)
                    
                    sectionRows.append(organizations)
                    sectionRows.append(services)
                    sectionRows.append(orders)
                    sectionRows.append(messages)
                    sectionRows.append(news)
                    sectionRows.append(management)
                    sectionRows.append(statistics)
                    sectionRows.append(discounts)

                case 1:
                    let personalPage    =   SlideMenu.Item.init(title: "Personal Page".localized(), imageName: "icon-menu-personal-page-normal", newPushCount: nil, isColor: false)
                    let settings        =   SlideMenu.Item.init(title: "Settings".localized(), imageName: "icon-menu-settings-normal", newPushCount: nil, isColor: false)
                    let help            =   SlideMenu.Item.init(title: "Help".localized(), imageName: "icon-menu-help-normal", newPushCount: nil, isColor: false)
                    
                    sectionRows.append(personalPage)
                    sectionRows.append(settings)
                    sectionRows.append(help)

                case 2:
                    let omnieSoft       =   SlideMenu.Item.init(title: "OmnieSoft".localized(), imageName: "icon-menu-omnie-soft-normal", newPushCount: nil, isColor: true)
                    
                    sectionRows.append(omnieSoft)

                    
                case 3:
                    let signOut         =   SlideMenu.Item.init(title: "Sign Out".localized(), imageName: "icon-menu-sign-out-normal", newPushCount: nil, isColor: false)
                    
                    sectionRows.append(signOut)
                    
                default:
                    break
                }
                
                sections.append(sectionRows)
            }
        }
    }
}
