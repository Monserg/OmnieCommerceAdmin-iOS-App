//
//  MediaManager.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 11.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

enum ImagePickerType {
    case Album
    case Camera
}

class MediaManager: BaseViewController {
    // MARK: - Properties
    var imagePickerType: ImagePickerType
    var imagePicker: UIImagePickerController?
    var handlerImagePickerControllerCompletion: HandlerImagePickerControllerCompletion?
    var handlerCancelButtonCompletion: HandlerCancelButtonCompletion?
    
    
    // MARK: - Class Initialization
    init(withImagePickerType imagePickerType: ImagePickerType) {
        self.imagePickerType = imagePickerType
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Custom Functions
    func didLoadImagePickerController() {
        imagePicker = UIImagePickerController()
        imagePicker?.allowsEditing = true
        imagePicker?.delegate = self

        switch imagePickerType {
        case .Album:
            if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
                imagePicker?.sourceType = .photoLibrary
            }

        case .Camera:
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker?.sourceType = .camera
                imagePicker?.allowsEditing = false
            } else {
                showAlertView(withTitle: "Error".localized(), andMessage: "Camera is not available".localized())
            }
        }
    }
}


// MARK: - UIImagePickerControllerDelegate
extension MediaManager: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        handlerImagePickerControllerCompletion!(info[UIImagePickerControllerOriginalImage] as! UIImage)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        handlerCancelButtonCompletion!()
    }
}
