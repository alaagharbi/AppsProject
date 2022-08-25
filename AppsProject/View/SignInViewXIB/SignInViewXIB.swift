import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabaseSwift
import FirebaseDatabase
import FirebaseAuth

class SignInViewXIB: UIView {
    
    @IBOutlet weak var returnBtn: UIButton!
    
    @IBOutlet weak var resetPasswordBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBAction func returnToHome(_ sender: UIButton) {
        let firt = Bundle.main.loadNibNamed("WelcomeXIB", owner: nil, options: nil)?.first as! WelcomeXIB
        self.addSubview(firt)
    }
    @IBAction func resetPassword(_ sender: Any) {
    }
    @IBAction func gotToMain(_ sender: UIButton) {
//        UserApi().SignIn(email: self.emailTF.text!,password : self.passwordTF.text!,onSuccess: navToView() , onError: onErrorFunction() )
//        let userID = Auth.auth().currentUser?.uid
//        print("----------")
//        print(userID!)
//        print("*----------------*")
//        let firt = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as! ProfileView
//        self.addSubview(firt)
        
        
     ///   self.uiviewco!.presentUiview(newView: firt)
            
            
            
//            Auth.auth().signIn(withEmail: "test1@gmail.com", password: "123456789") { [weak self] authResult, error in
//              guard let strongSelf = self else { return }
//              print("sucess")
//                            }
//   self.view.endEditiong(true)
        self.signIn(onSuccess: {self.navToView()}){
            (errorMessage) in
            print(errorMessage)
        }
    }
    func onErrorFunction() {
        print("error !!!!")
    }
    func navToView(){
        print("user Success")
        let firt = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as! ProfileView
        self.addSubview(firt)
    }
    func signIn(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        //affichage du progressBar
        UserApi().SignIn(email: self.emailTF.text!, password : self.passwordTF.text!, onSuccess: {
            onSuccess()
        })
        {
            (errorMessage) in
            onError(errorMessage)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
