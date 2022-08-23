import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth



class SignInXIB: UIView {
    var uiviewco : ViewController?
    @IBAction func goBack(_ sender: UIButton) {
        let firt = Bundle.main.loadNibNamed("WelcomeXIB", owner: nil, options: nil)?.first as! WelcomeXIB
        self.addSubview(firt)
    }
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func Login(_ sender: UIButton) {
        UserApi().SignIn(email: self.emailField.text!,password : self.password.text!)
        let userID = Auth.auth().currentUser?.uid
        print("----------")
        print(userID!)
        print("*----------------*")
        let firt = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as! ProfileView
        self.addSubview(firt)
    }
    override func awakeFromNib() {

    }

}
