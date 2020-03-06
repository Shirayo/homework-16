//
//  AddPhotoViewController.swift
//  homework №16 v1.0
//
//  Created by Shirayo on 06.03.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var photoName: UITextField!
    let pickerController = UIImagePickerController()
    var finishHandler: ((Photos) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
    }

    @IBAction func choosePhotoDidClick(_ sender: Any) {
        let alertController = UIAlertController(title: "What to open", message: nil, preferredStyle: .actionSheet)
               alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                   self.pickerController.allowsEditing = true
                   self.pickerController.sourceType = .camera
                   self.present(self.pickerController, animated: true, completion: nil)
               }))
               alertController.addAction(UIAlertAction(title: "Library", style: .default, handler: { _ in
                   self.pickerController.allowsEditing = true
                   self.pickerController.sourceType = .photoLibrary
                   self.present(self.pickerController, animated: true, completion: nil)
               }))
               present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addButtonDidClick(_ sender: Any) {
        let savePhoto = Photos(photoName: photoName.text!, image: photo.image!)
        finishHandler?(savePhoto)
        navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                                  didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
               photo.image = image
           }
           pickerController.dismiss(animated: true, completion: nil)
       }
}

