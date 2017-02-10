//
//  OrganizationMapShowViewController.swift
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

// MARK: - Input protocols for current ViewController component VIP-cicle
protocol OrganizationMapShowViewControllerInput {
    func displaySomething(viewModel: OrganizationMapShowModels.Location.ViewModel)
}

// MARK: - Output protocols for Interactor component VIP-cicle
protocol OrganizationMapShowViewControllerOutput {
    func didLoadCurrentLocation(requestModel: OrganizationMapShowModels.Location.RequestModel)
}

class OrganizationMapShowViewController: BaseViewController {
    // MARK: - Properties
    var interactor: OrganizationMapShowViewControllerOutput!
    var router: OrganizationMapShowRouter!
    
    private var locationManager: CLLocationManager?

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchTextField: CustomTextField!
    @IBOutlet weak var customNavigationBarView: MainNavigationBarView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    
    // MARK: - Class initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
        OrganizationMapShowConfigurator.sharedInstance.configure(viewController: self)
    }
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doSomethingOnLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        mapView.showsUserLocation = false
        locationManager!.stopUpdatingLocation()
        locationManager = nil

        super.viewDidDisappear(true)
    }
    
    
    // MARK: - Custom Functions
    func doSomethingOnLoad() {
        // Set left bar button image
        customNavigationBarView.leftButton.setImage(UIImage.init(named: "icon-navbar-back-normal"), for: .normal)
        
//        let requestModel = OrganizationMapShowModels.Location.RequestModel(address: searchTextField.text)
//        interactor.didLoadCurrentLocation(requestModel: requestModel)

        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager!.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager!.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager!.requestLocation()
        }

        
        mapView.delegate = self

        // Handler left bar button
        customNavigationBarView.handlerNavBarLeftButtonCompletion = { _ in
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    // MARK: - Actions
    @IBAction func handlerAddButtonTap(_ sender: CustomButton) {
    }
    
    @IBAction func handlerCancelButtonTap(_ sender: CustomButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    // MAP
    func didCenterOnCurrentPosition(_ mapView: MKMapView, withLocation location: CLLocation) {
        var region = MKCoordinateRegion()
        region.center = location.coordinate
        
        var span = MKCoordinateSpan()
        span.latitudeDelta = 0.05
        span.longitudeDelta = 0.05
        region.span = span
        
        mapView.setRegion(region, animated: true)
    }
}


// MARK: - ForgotPasswordShowViewControllerInput
extension OrganizationMapShowViewController: OrganizationMapShowViewControllerInput {
    func displaySomething(viewModel: OrganizationMapShowModels.Location.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
}


extension OrganizationMapShowViewController: MKMapViewDelegate {
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        spinner.startAnimating()
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        if (fullyRendered) {
            spinner.stopAnimating()
        }
    }
}


// MARK: - CLLocationManagerDelegate
extension OrganizationMapShowViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        didCenterOnCurrentPosition(mapView, withLocation: locations.last!)

//        CLGeocoder().reverseGeocodeLocation(locations.last!, completionHandler: {(placemarks:[CLPlacemark]?, error:NSError?) -> Void in
//            if let placemarks = placemarks {
//                let placemark = placemarks[0]
//                
//            }
//            } as! CLGeocodeCompletionHandler)
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


