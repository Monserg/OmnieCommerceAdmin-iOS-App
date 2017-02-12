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
    func didShowLocation(viewModel: OrganizationMapShowModels.Location.ViewModel)
}

// MARK: - Output protocols for Interactor component VIP-cicle
protocol OrganizationMapShowViewControllerOutput {
    func didLoadLocation(requestModel: OrganizationMapShowModels.Location.RequestModel)
    func didStopUpdateLocation(requestModel: OrganizationMapShowModels.Location.RequestModel)
}

class OrganizationMapShowViewController: BaseViewController {
    // MARK: - Properties
    var interactor: OrganizationMapShowViewControllerOutput!
    var router: OrganizationMapShowRouter!

    private let locationManager = LocationManager()
    var pointTouchOnMapView: CGPoint?

    // Route data
    var pointAnnotation = PointAnnotation()
    
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            // Delegates
            mapView.delegate = self
        }
    }
    
    @IBOutlet weak var searchTextField: CustomTextField! {
        didSet{
            // Delegates
            searchTextField.delegate = self
        }
    }
    
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
        
        doInitialSetupOnLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // Pass route data to previuos scene
        router.didPassDataToOrganizationAddShowScene(passData: pointAnnotation)
        
        // Stop GeoLocation manager
        let locationRequestModel = OrganizationMapShowModels.Location.RequestModel(locationManager: locationManager, searchLocation: SearchLocation(nil, nil))
        interactor.didStopUpdateLocation(requestModel: locationRequestModel)

        super.viewDidDisappear(true)
    }
    
    
    // MARK: - Custom Functions
    func doInitialSetupOnLoad() {
        // Set left bar button image
        customNavigationBarView.leftButton.setImage(UIImage.init(named: "icon-navbar-back-normal"), for: .normal)
        
        // Start GeoLocation manager with current user position
        didStartGeocoding()
        
        // Handler left bar button
        customNavigationBarView.handlerNavBarLeftButtonCompletion = { _ in
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    // Geocoding
    func didStartGeocoding() {
        spinner.startAnimating()
        
        let requestModel = OrganizationMapShowModels.Location.RequestModel(locationManager: locationManager, searchLocation: SearchLocation(pointAnnotation.coordinate, searchTextField.text))
        interactor.didLoadLocation(requestModel: requestModel)
    }
    
    // Centering map
    func didShowLocationOnMapViewCenter(coordinate: CLLocationCoordinate2D?) {
        guard coordinate != nil else {
            return
        }
        
        var region = MKCoordinateRegion()
        region.center = coordinate!
        
        var span = MKCoordinateSpan()
        span.latitudeDelta = 0.05
        span.longitudeDelta = 0.05
        region.span = span
        
        mapView.setRegion(region, animated: true)
    }

    func didAddAnnotation(placemark: CLPlacemark?) {
        guard placemark != nil else {
            return
        }

        mapView.addAnnotations(mapView.selectedAnnotations)
        
        mapView.showAnnotations([pointAnnotation], animated: true)
        mapView.selectAnnotation(pointAnnotation, animated: true)
    }
    
    // MARK: - Actions
    @IBAction func handlerAddButtonTap(_ sender: CustomButton) {
    }
    
    @IBAction func handlerCancelButtonTap(_ sender: CustomButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Gestures
    @IBAction func handlerLongGestureRecognizer(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            pointTouchOnMapView = sender.location(in: mapView)
            pointAnnotation.coordinate = mapView.convert((pointTouchOnMapView)!, toCoordinateFrom: mapView)
        }
    }
}


// MARK: - ForgotPasswordShowViewControllerInput
extension OrganizationMapShowViewController: OrganizationMapShowViewControllerInput {
    func didShowLocation(viewModel: OrganizationMapShowModels.Location.ViewModel) {
        self.pointAnnotation.coordinate = (viewModel.resultLocation?.coordinate!)!
        self.pointAnnotation.subtitle = viewModel.resultLocation?.address
        
        didAddAnnotation(placemark: viewModel.resultLocation?.placemark)
        didShowLocationOnMapViewCenter(coordinate: viewModel.resultLocation?.coordinate)
    }
    
    func didDismissViewController(viewModel: OrganizationMapShowModels.Location.ViewModel) {
        mapView.showsUserLocation = false
    }
}


// MARK: - MKMapViewDelegate
extension OrganizationMapShowViewController: MKMapViewDelegate {
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        if (fullyRendered) {
            spinner.stopAnimating()
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "CustomPin"
        var pinAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if (pinAnnotationView != nil) {
            pinAnnotationView?.annotation = annotation
        } else {
            pinAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            pinAnnotationView?.image = UIImage(named: "icon-location-normal")
            pinAnnotationView?.frame.size = CGSize.init(width: 50, height: 50)
        }
        
        pinAnnotationView?.canShowCallout = true

        // Add organization image
        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 44, height: 33))

        guard let avatar = pointAnnotation.image else {
            leftIconView.image = UIImage(named: "icon-empty-organization-normal")
            leftIconView.backgroundColor = UIColor.veryLightGray
            pinAnnotationView?.leftCalloutAccessoryView = leftIconView
            
            return pinAnnotationView
        }
        
        leftIconView.image = avatar
        pinAnnotationView?.leftCalloutAccessoryView = leftIconView
        
        return pinAnnotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        view.canShowCallout = true
    }
    
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
//        switch newState {
//        case .starting:
//            view.dragState = .dragging
//        
//        case .ending, .canceling:
//            view.dragState = .none
//            let latitude = view.annotation?.coordinate.latitude
//            let longitude = view.annotation?.coordinate.longitude
//            
//            print(object: "Finish pin lat \(latitude) long \(longitude)")
//        
//        default:
//            break
//        }
//    }
}


// MARK: - UITextFieldDelegate
extension OrganizationMapShowViewController {
    // Clear button tap
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }
    
    // Hide keyboard
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    
    // TextField editing
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true;
    }
    
    // Return button tap
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        
        // Start GeoLocation manager with string address
        didStartGeocoding()
        
        return true;
    }
}

