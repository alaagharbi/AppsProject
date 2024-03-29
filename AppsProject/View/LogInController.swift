
import UIKit

class LogInController: UIViewController {
    @IBOutlet weak var lablet: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
  
    

    @IBAction func logTo(_ sender: UIButton) {
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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        
        // This is to get the SceneDelegate object from your view controller
        // then call the change root view controller function to change to main tab bar
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        
       // present(TabBarViewController(), animated: true)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lablet.adjustsFontSizeToFitWidth = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
        @objc func keyboardWillShow(sender: NSNotification) {
             self.view.frame.origin.y = -150 // Move view 150 points upward
        }

        @objc func keyboardWillHide(sender: NSNotification) {
             self.view.frame.origin.y = 0 // Move view to original position
        }
}
