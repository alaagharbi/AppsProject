//
//  AddBookViewController.swift
//  AppsProject
//
//  Created by ag mac on 30/9/2022.
//

import UIKit

class AddBookViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var pickedImage = false

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var bookAddBtn: UIButton!
    @IBOutlet weak var bookCoverIV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func selectCover(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) && !pickedImage {
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self
                imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
                pickedImage = true
        }
    }
    //    override func viewDidAppear(_ animated: Bool) {
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) && !pickedImage {
//            let imagePickerController = UIImagePickerController()
//            imagePickerController.delegate = self
//            imagePickerController.sourceType = .photoLibrary
//            self.present(imagePickerController, animated: true, completion: nil)
//            pickedImage = true
//        }
//    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        bookCoverIV.image = image
        self.dismiss(animated: true, completion: nil)
    }
}
