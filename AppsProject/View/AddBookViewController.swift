//
//  AddBookViewController.swift
//  AppsProject
//
//  Created by ag mac on 30/9/2022.
//

import UIKit
import Firebase
//import FirebaseStorageSwift

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
    @IBAction func addBokSubmitCover(_ sender: UIButton) {
        let randomID = UUID.init().uuidString
        let uploaderRef = Storage.storage().reference(withPath: "bookCover/\(randomID).jpg")
        guard let imageData = bookCoverIV.image?.jpegData(compressionQuality: 0.75) else { return }
        let uploadMetaData = StorageMetadata.init()
        uploadMetaData.contentType = "image/jpeg"
        uploaderRef.putData(imageData, metadata: uploadMetaData){
            (downloadMetadata, error) in
            if let error = error {
                print("Got an error !! \(error.localizedDescription)")
                return
            }
            print("put is competed and i got this back : \(String(describing: downloadMetadata))")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        bookCoverIV.image = image
        self.dismiss(animated: true, completion: nil)
    }
}
