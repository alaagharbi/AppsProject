
import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
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
