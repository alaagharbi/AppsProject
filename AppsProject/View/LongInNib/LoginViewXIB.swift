import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabaseSwift
import FirebaseDatabase
import FirebaseAuth
import AuthenticationServices
import FirebaseAuthCombineSwift
import LocalAuthentication

class LoginViewXIB: UIView{

    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var lastnameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var birthdabyTF: UITextField!
    
    @IBOutlet weak var genderSelector: UISegmentedControl!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var repeatePasswordTF: UITextField!
    
    @IBOutlet weak var adressTF: UITextField!
    
    @IBOutlet weak var submitBT: UIButton!
    
    @IBAction func submit(_ sender: Any) {
        let signInstatus = UserApi().signUp(email: self.emailTF.text!, password: self.passwordTF.text!, phone: self.phoneTF.text!, name: self.nameTF.text!, lastname: self.lastnameTF.text!, address: self.adressTF.text!, gender: self.nameTF.text!, birthday: self.birthdabyTF.text!)
        
        if(signInstatus){
            print("true")
           let moveto = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as! ProfileView
            self.addSubview(moveto)
        }
        else {print("check urrr inputs mannnnn !!!!!!!")}
    /*    let storyboard = UIStoryboard(name: "MainView", bundle: nil)
                let currentOrderVC = storyboard.instantiateViewController(withIdentifier: "mainView") as! MainViewController

                var nav1 = UINavigationController()
                nav1.viewControllers = [currentOrderVC]

                UIApplication.shared.keyWindow?.rootViewController
                UIApplication.shared.keyWindow?.rootViewController = nav1
                UIApplication.shared.keyWindow?.makeKeyAndVisible();*/
    }
    
    @IBAction func signInBtn(_ sender: UIButton) {
        let first = Bundle.main.loadNibNamed("SignInViewXIB", owner: nil, options: nil)?.first as! SignInViewXIB
        self.addSubview(first)
    }
    let datepicker = UIDatePicker()
  
    override func awakeFromNib(){
        
        super.awakeFromNib()
        self.nameTF.delegate = self
        self.lastnameTF.delegate = self
        self.emailTF.delegate = self
        self.phoneTF.delegate = self
        self.birthdabyTF.delegate = self
        self.passwordTF.delegate = self
        self.repeatePasswordTF.delegate = self
        self.adressTF.delegate = self
        profileImage.roundedImage()
        createDatePicker()
        
    }
}
extension LoginViewXIB :UITextFieldDelegate {
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
           if birthdabyTF.isFirstResponder {
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
        birthdabyTF.inputView = datepicker
               let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(self.datePickerDone))
               let toolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 44))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil), doneButton], animated: true)
        birthdabyTF.inputAccessoryView = toolBar
       }
    @objc func datePickerDone() {
          birthdabyTF.resignFirstResponder()
      }
      @objc func dateChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
     dateFormatter.dateFormat = .none
        self.birthdabyTF.text = dateFormatter.string(from: datepicker.date)
      }
    func roundedImage(){
        self.profileImage.clipsToBounds = true
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
    }
}
