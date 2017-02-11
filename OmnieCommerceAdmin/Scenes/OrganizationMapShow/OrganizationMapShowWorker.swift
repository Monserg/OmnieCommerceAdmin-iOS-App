//
//  OrganizationMapShowWorker.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 10.02.17.
//  Copyright (c) 2017 Omniesoft. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import MapKit

class OrganizationMapShowWorker {
    func startCoreLocation(withSearchLocation searchLocation: SearchLocation?) /* -> ResultLocation?*/ {
        let locationManager = LocationManager()
        
        locationManager.startCoreLocation(withSearchLocation: searchLocation)
        
        return locationManager.handlerLocationCompletion = { result in
//            return result
        }
        
        //return nil
    }
    
    func stopCoreLocation() {
        let locationManager = LocationManager()
        
        locationManager.stopCoreLocation()
    }
}
