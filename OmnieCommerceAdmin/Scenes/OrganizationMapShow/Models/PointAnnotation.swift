//
//  PointAnnotation.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 12.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit
import MapKit

class PointAnnotation {
    // MARK: - Properties
    var title: String?
    var subtitle: String? {
        didSet {
            annotation.subtitle = subtitle
        }
    }
    
    var coordinate: CLLocationCoordinate2D? {
        didSet{
            annotation.coordinate = coordinate ?? CLLocationCoordinate2D.init()
        }
    }
    
    var image: UIImage?
    var annotation = MKPointAnnotation()
    var isRegionChange = false
    
    
    // MARK: - Custom Functions
    func didUpdate(fromViewModel viewModel: ResultLocation) {
        subtitle = viewModel.address
        coordinate = viewModel.coordinate
        
        annotation.title = title
//        annotation.subtitle = subtitle
//        annotation.coordinate = coordinate ?? CLLocationCoordinate2D.init()
    }
    
    func didFill(fromPointAnnotation pointAnnotation: PointAnnotation) {
        self.title = pointAnnotation.title
        self.subtitle = pointAnnotation.subtitle
        self.coordinate = pointAnnotation.coordinate
        self.image = pointAnnotation.image
        self.annotation.title = pointAnnotation.annotation.title
    }
}
