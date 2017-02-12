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
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D?
    var image: UIImage?
    var annotation = MKPointAnnotation()
    var isRegionChange = false
    
    
    // MARK: - Custom Functions
    private func didUpdate(fromPinAnnotation pointAnnotation: MKPointAnnotation) {
        title = pointAnnotation.title
        subtitle = pointAnnotation.subtitle
        coordinate = pointAnnotation.coordinate
    }
    
    func didUpdateAnnotation() {
        annotation.title = title
        annotation.subtitle = subtitle
        annotation.coordinate = coordinate ?? CLLocationCoordinate2D.init()
        
        didUpdate(fromPinAnnotation: annotation)
    }
    
    func didUpdate(fromPointAnnotation pointAnnotation: PointAnnotation) {
        self.title = pointAnnotation.title
        self.subtitle = pointAnnotation.subtitle
        self.coordinate = pointAnnotation.coordinate
        self.image = pointAnnotation.image
        self.annotation = pointAnnotation.annotation
    }
}
