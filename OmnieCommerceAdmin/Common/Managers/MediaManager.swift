//
//  MediaManager.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 11.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

class MediaManager: BaseViewController {
    // MARK: - Properties
    var imagePicker: UIImagePickerController?
    var handlerImagePickerControllerCompletion: HandlerImagePickerControllerCompletion?
    var handlerCancelButtonCompletion: HandlerCancelButtonCompletion?
    
    
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
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            imagePicker = UIImagePickerController()
            imagePicker?.sourceType = .photoLibrary
            imagePicker?.allowsEditing = true
            imagePicker?.delegate = self
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
