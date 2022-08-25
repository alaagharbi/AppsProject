import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabaseSwift
import FirebaseDatabase
import FirebaseAuth

class WelcomeXIB: UIView {
    @IBOutlet weak var WelcomingLabel: UILabel!
    
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var registerbtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        uiView.layer.cornerRadius = 50.0
        uiView.layer.masksToBounds = true
        registerbtn.btnShhape()
        loginBtn.btnShhape()
    }
//    func setupUI() {
//        let title = "Create a new account"
//   //     let attributedext = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 20)!,NSAttributedString.Key.foregroundColor : UIColor.brown ])        attributedext.append(attributedext)
//
//
//    //    WelcomingLabel.attributedText = attributedext
//     //   registerbtn.attributedTitle = NSMutableAttributedString(string: "Register", attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 20)!,])
//  
//        //   UIFont.init(name: "Didot", size: 30)
//    }
    @IBAction func sendToLogin(_ sender: UIButton) {
        let firt = Bundle.main.loadNibNamed("LoginViewXIB", owner: nil, options: nil)?.first as! LoginViewXIB
        self.addSubview(firt)
        
    }
    
    @IBAction func sendToRegister(_ sender: UIButton) {
        let firt = Bundle.main.loadNibNamed("SignInViewXIB", owner: nil, options: nil)?.first as! SignInViewXIB
        self.addSubview(firt)
    }
}
