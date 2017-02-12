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
    var pinAnnotationView: MKAnnotationView!
    var pointTouchOnMapView: CGPoint?

    var handlerLocationAddButtonCompletion: HandlerLocationAddButtonCompletion?
    var handlerCancelButtonCompletion: HandlerCancelButtonCompletion?
    
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
        // Stop GeoLocation manager
        let locationRequestModel = OrganizationMapShowModels.Location.RequestModel(locationManager: locationManager, searchLocation: SearchLocation(nil, nil))
        interactor.didStopUpdateLocation(requestModel: locationRequestModel)

        super.viewDidDisappear(true)
    }
    
    
    // MARK: - Custom Functions
    func doInitialSetupOnLoad() {
        // Set left bar button image
        customNavigationBarView.leftButton.setImage(UIImage.init(named: "icon-navbar-back-normal"), for: .normal)
        
        // Customize map view
        mapView.showsScale = true
        mapView.showsCompass = true
        
        // Start GeoLocation manager with current user position
        didStartGeocoding()
        
        // Handler left bar button
        customNavigationBarView.handlerNavBarLeftButtonCompletion = { _ in
            self.handlerCancelButtonCompletion!()
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
        guard let regionCoordinate = coordinate else {
            return
        }
        
        mapView.setRegion(MKCoordinateRegionMake(regionCoordinate, MKCoordinateSpanMake(0.003, 0.003)), animated: true)
    }

    func didAddAnnotation(placemark: CLPlacemark?) {
        guard placemark != nil else {
            return
        }

        mapView.addAnnotations(mapView.selectedAnnotations)
        
        mapView.showAnnotations([pointAnnotation.annotation], animated: true)
        mapView.selectAnnotation(pointAnnotation.annotation, animated: true)
        didShowLocationOnMapViewCenter(coordinate: placemark?.location?.coordinate)
        
        if (pointAnnotation.isRegionChange) {
            spinner.stopAnimating()
            pointAnnotation.isRegionChange = false
        }
    }
    
    // Remove annotation to new location
    func didMoveAnnotation(toLocation coordinate: CLLocationCoordinate2D) {
        UIView.animate(withDuration: 0.5, animations: {
            self.pointAnnotation.coordinate = coordinate
        }, completion: { success in
            self.didShowLocationOnMapViewCenter(coordinate: coordinate)
            
            self.didStartGeocoding()
        })
    }
    
    
    // MARK: - Actions
    @IBAction func handlerAddButtonTap(_ sender: CustomButton) {
        handlerLocationAddButtonCompletion!(pointAnnotation)
    }
    
    @IBAction func handlerCancelButtonTap(_ sender: CustomButton) {
        handlerCancelButtonCompletion!()
    }
    
    
    // MARK: - Gestures
    @IBAction func handlerLongGestureRecognizer(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            pinAnnotationView.canShowCallout = false

            pointTouchOnMapView = sender.location(in: mapView)
            let newCoordinate = mapView.convert((pointTouchOnMapView)!, toCoordinateFrom: mapView)
            
            didMoveAnnotation(toLocation: newCoordinate)
        }
    }
}


// MARK: - ForgotPasswordShowViewControllerInput
extension OrganizationMapShowViewController: OrganizationMapShowViewControllerInput {
    func didShowLocation(viewModel: OrganizationMapShowModels.Location.ViewModel) {
        self.pointAnnotation.didUpdate(fromViewModel: viewModel.resultLocation!)
        didAddAnnotation(placemark: viewModel.resultLocation?.placemark)
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
        pinAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        pinAnnotationView?.frame.origin = CGPoint.init(x: mapView.bounds.midX, y: -5250)
        
        if (pinAnnotationView != nil) {
            pinAnnotationView?.annotation = annotation
        } else {
            pinAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            pinAnnotationView?.image = UIImage(named: "icon-location-normal")
            pinAnnotationView?.frame.size = CGSize.init(width: 50, height: 50)
        }
        
        pinAnnotationView?.canShowCallout = false
        pinAnnotationView?.isDraggable = true

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
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        switch newState {
        case .starting:
            view.dragState = .dragging
            
        case .ending, .canceling:
            view.dragState = .none
            pinAnnotationView.canShowCallout = false

            didMoveAnnotation(toLocation: mapView.convert(view.center, toCoordinateFrom: mapView))
        
        default:
            break
        }
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        pointAnnotation.isRegionChange = true
        print(object: "region")
    }
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
        textField.text = nil
        
        return true;
    }
}
