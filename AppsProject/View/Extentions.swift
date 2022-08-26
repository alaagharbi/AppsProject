//
//  Extentions.swift
//  AppsProject
//
//  Created by Alaa Gharbi on 8/16/22.
//

import UIKit
extension UIImageView {
    func roundedImage(){
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
}
extension UIViewController{
    func showToast(message : String, seconds: Double){
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.view.backgroundColor = .black
            alert.view.alpha = 0.5
            alert.view.layer.cornerRadius = 15
            self.present(alert, animated: true)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
                alert.dismiss(animated: true)
            }
        }
}
extension UIButton {
        func btnShhape() {
            self.layer.cornerRadius = 10.0
            self.layer.masksToBounds = true
            
        }
    }
extension UIImageView {
   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
   func downloadImage(from url: URL) {
      getData(from: url) {
         data, response, error in
         guard let data = data, error == nil else {
            return
         }
         DispatchQueue.main.async() {
            self.image = UIImage(data: data)
         }
      }
   }

}
