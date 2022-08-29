//
//  SignInViewController.swift
//  AppsProject
//
//  Created by ag mac on 26/8/2022.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabaseSwift
import FirebaseDatabase
import FirebaseAuth
import AuthenticationServices
import FirebaseAuthCombineSwift
import LocalAuthentication

class SignInViewController: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var birthdayTF: UITextField!
    @IBOutlet weak var genderSC: UISegmentedControl!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var adressTF: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    let datepicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()

  
        self.nameTF.delegate = self
        self.lastNameTF.delegate = self
        self.emailTF.delegate = self
        self.phoneTF.delegate = self
        self.birthdayTF.delegate = self
        self.passwordTF.delegate = self
        self.confirmPasswordTF.delegate = self
        self.adressTF.delegate = self
        profileImage.roundedImage()
        createDatePicker()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
    }
    
    @IBAction func goToLogIn(_ sender: UIButton) {
        present(LogInViewController(), animated: true)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
}

extension SignInViewController :UITextFieldDelegate {
    ///hedhi function controlles 3ala letters t5allik taccepti ken caracteret elli 7ejtek bihom

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        ///For mobile numer validation
        if textField == phoneTF {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789 ")
         ///Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == phoneTF{
        let maxLength = 1
           let currentString = (textField.text ?? "") as NSString
           let newString = currentString.replacingCharacters(in: range, with: string)

            return newString.count <= maxLength
            
        }
        return true
    }
    ///Hedhi neblokiyou beha menu elli feha select w copy w paste w seleyt w recherche wghirou
       override func canPerformAction(_ action: Selector, withSender sender: Any?) ->  Bool {
           if birthdayTF.isFirstResponder {
               DispatchQueue.main.async(execute: {
                   (sender as? UIMenuController)?.setMenuVisible(false, animated: false)
               })
               return false
           }

           return super.canPerformAction(action, withSender: sender)
       }
       
       func createDatePicker()
       {
           datepicker.preferredDatePickerStyle = .wheels
           datepicker.datePickerMode = .date

        datepicker.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)
        birthdayTF.inputView = datepicker
               let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(self.datePickerDone))
        let toolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil), doneButton], animated: true)
        birthdayTF.inputAccessoryView = toolBar
       }
    @objc func datePickerDone() {
          birthdayTF.resignFirstResponder()
      }
      @objc func dateChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
     dateFormatter.dateFormat = .none
        self.birthdayTF.text = dateFormatter.string(from: datepicker.date)
      }
    func roundedImage(){
        self.profileImage.clipsToBounds = true
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
    }

}
