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
        let storyboardName: String!
    }
    
    struct Items {
        // MARK: - Properties
        var sections = Array<Array<SlideMenu.Item>>()
        
        
        // MARK: - Functions
        init() {
            for i in 0...3 {
                var sectionRows = Array<SlideMenu.Item>()

                switch i {
                case 0:
                    let organizations   =   SlideMenu.Item.init(title: "Organizations".localized(), imageName: "icon-menu-organizations-normal", newPushCount: nil, isColor: false, storyboardName: "OrganizationsShow")
                    let services        =   SlideMenu.Item.init(title: "Services".localized(), imageName: "icon-menu-services-normal", newPushCount: nil, isColor: false, storyboardName: "ServicesShow")
                    let orders          =   SlideMenu.Item.init(title: "Orders".localized(), imageName: "icon-menu-orders-normal", newPushCount: nil, isColor: false, storyboardName: "OrdersShow")
                    let messages        =   SlideMenu.Item.init(title: "Messages".localized(), imageName: "icon-menu-messages-normal", newPushCount: 0, isColor: false, storyboardName: "MessagesShow")
                    let news            =   SlideMenu.Item.init(title: "News".localized(), imageName: "icon-menu-news-normal", newPushCount: nil, isColor: false, storyboardName: "NewsShow")
                    let management      =   SlideMenu.Item.init(title: "Management Resources".localized(), imageName: "icon-menu-management-resources-normal", newPushCount: nil, isColor: false, storyboardName: "ManagementResourcesShow")
                    let statistics      =   SlideMenu.Item.init(title: "Statistics".localized(), imageName: "icon-menu-statistics-normal", newPushCount: nil, isColor: false, storyboardName: "StatisticsShow")
                    let discounts       =   SlideMenu.Item.init(title: "Discounts".localized(), imageName: "icon-menu-discounts-normal", newPushCount: nil, isColor: false, storyboardName: "DiscountsShow")
                    
                    sectionRows.append(organizations)
                    sectionRows.append(services)
                    sectionRows.append(orders)
                    sectionRows.append(messages)
                    sectionRows.append(news)
                    sectionRows.append(management)
                    sectionRows.append(statistics)
                    sectionRows.append(discounts)

                case 1:
                    let personalPage    =   SlideMenu.Item.init(title: "Personal Page".localized(), imageName: "icon-menu-personal-page-normal", newPushCount: nil, isColor: false, storyboardName: "PersonalPageShow")
                    let settings        =   SlideMenu.Item.init(title: "Settings".localized(), imageName: "icon-menu-settings-normal", newPushCount: nil, isColor: false, storyboardName: "SettingsShow")
                    let help            =   SlideMenu.Item.init(title: "Help".localized(), imageName: "icon-menu-help-normal", newPushCount: nil, isColor: false, storyboardName: "HelpShow")
                    
                    sectionRows.append(personalPage)
                    sectionRows.append(settings)
                    sectionRows.append(help)

                case 2:
                    let omnieSoft       =   SlideMenu.Item.init(title: "OmnieSoft".localized(), imageName: "icon-menu-omnie-soft-normal", newPushCount: nil, isColor: true, storyboardName: "OmnieSoft")
                    
                    sectionRows.append(omnieSoft)

                    
                case 3:
                    let signOut         =   SlideMenu.Item.init(title: "Sign Out".localized(), imageName: "icon-menu-sign-out-normal", newPushCount: nil, isColor: false, storyboardName: "SignOut")
                    
                    sectionRows.append(signOut)
                    
                default:
                    break
                }
                
                sections.append(sectionRows)
            }
        }
    }
}
