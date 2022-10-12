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

    @IBAction func downloadImage(_ sender: Any) {
        let storageRef = Storage.storage().reference(withPath: "bookCover/1A889B9B-DA5F-416C-9685-65B0B3633964.jpg")
        let taskReference = storageRef.getData(maxSize: 4 * 1024 * 1024){
            [weak self](data, error) in
            if let error = error {
                print("got an error in \(error.localizedDescription)")
                return
            }
            if let data = data {
                self?.bookCoverIV.image = UIImage(data: data)
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        bookCoverIV.image = image
        self.dismiss(animated: true, completion: nil)
    }
}
