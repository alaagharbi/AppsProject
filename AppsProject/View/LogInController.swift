
import UIKit

class LogInController: UIViewController {
    @IBOutlet weak var lablet: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lablet.adjustsFontSizeToFitWidth = true
    }
    

    @IBAction func logTo(_ sender: UIButton) {
    }
   

}
