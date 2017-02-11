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
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startCoreLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Custom Functions
    func startCoreLocation() {
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager!.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager!.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager!.requestLocation()
        }
    }
    
    func stopCoreLocation() {
        locationManager!.stopUpdatingLocation()
        locationManager = nil
    }
    
    private func didCenterOnCurrentPosition(_ mapView: MKMapView, withLocation location: CLLocation) {
        var region = MKCoordinateRegion()
        region.center = location.coordinate
        
        var span = MKCoordinateSpan()
        span.latitudeDelta = 0.05
        span.longitudeDelta = 0.05
        region.span = span
        
        mapView.setRegion(region, animated: true)
    }
}


// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        didCenterOnCurrentPosition(mapView, withLocation: locations.last!)
        
        CLGeocoder().reverseGeocodeLocation(locations.last!) { placemarks, error in
            guard placemarks != nil else {
                return
            }
            
            let placemark = placemarks![0]
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(object: error)
    }
    
    //
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, . authorizedAlways:
            mapView?.showsUserLocation = true
            
        default:
            showAlertView(withTitle: "Info", andMessage: "Please go into Settings and give this app authorization to your location.")
        }
    }
}
