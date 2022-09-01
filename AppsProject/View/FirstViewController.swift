
import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        logInBtn.btnShhape()
//        signInBtn.btnShhape()
    // Do any additional setup after loading the 
    }
    

    
    @IBAction func gotoSignIn(_ sender: UIButton) {
        present(SignInViewController(), animated: true)
    }
    @IBAction func gotoLogin(_ sender: UIButton) {
        show(LogInViewController(), sender: signInBtn)
    }
    
}
