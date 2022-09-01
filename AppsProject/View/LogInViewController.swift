
import UIKit


class LogInViewController: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBAction func LogToMain(_ sender: Any) {
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
        present(SlitViewController(), animated: true)
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
