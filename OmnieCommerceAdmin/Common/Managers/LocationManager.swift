//
//  LocationManager.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 11.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationManager: BaseViewController {
    // MARK: - Properties
    private var locationManager: CLLocationManager?
    var handlerLocationCompletion: HandlerLocationCompletion?
    var searchLocation: SearchLocation?
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Custom Functions
    func startCoreLocation(withSearchLocation searchLocation: SearchLocation?) {
        self.searchLocation = searchLocation
        
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager!.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager!.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager!.requestLocation()
        }
//        
//        locationManager?.startUpdatingLocation()
    }
    
    func stopCoreLocation() {
        locationManager?.stopUpdatingLocation()
        locationManager = nil
    }
}


// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        didCenterOnCurrentPosition(mapView, withLocation: locations.last!)
        
        guard searchLocation != nil else {
            return
        }
        
        // Geocoding current user location
        if (searchLocation?.address == nil) {
            CLGeocoder().reverseGeocodeLocation(locations.last!) { placemarks, error in
                guard placemarks != nil else {
                    self.handlerLocationCompletion!(ResultLocation(nil, nil))

                    return
                }
                
                let placemark = placemarks![0]
                self.handlerLocationCompletion!(ResultLocation(placemark, locations.last!.coordinate))
            }
        }
        
        // Geocoding point on map

        // Geocoding string address
        else if (searchLocation?.mapPoint != nil) {
            CLGeocoder().geocodeAddressString((searchLocation?.address!)!, completionHandler: { placemarks, error in
                guard placemarks != nil else {
                    self.handlerLocationCompletion!(ResultLocation(nil, nil))
                    
                    return
                }
                
                let placemark = placemarks![0]
                self.handlerLocationCompletion!(ResultLocation(placemark, locations.last!.coordinate))
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        showAlertView(withTitle: "Error".localized(), andMessage: error.localizedDescription)
    }
    
    // Check Authorization status
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status != .authorizedAlways || status != .authorizedWhenInUse) {
            showAlertView(withTitle: "Info".localized(), andMessage: "Location authorization error".localized())
        }
    }
}
