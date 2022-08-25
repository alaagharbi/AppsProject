import UIKit
import Alamofire
import RxSwift
import RxCocoa

class ProfileView: UIView {
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var birthdayLB: UILabel!
    @IBOutlet weak var emailLB: UILabel!
    @IBOutlet weak var lastNameLB: UILabel!
    
    @IBAction func editUserProfile(_ sender: Any) {
        let firt = Bundle.main.loadNibNamed("EditProfileViewXIB", owner: nil, options: nil)?.first as! EditProfileViewXIB
        self.addSubview(firt)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        UserApi().getUserInformation(onSuccess: {self.afffectValues()})
        print("--------")
        print(UserInformation.defaults.bool(forKey: "email"))
        print("--------")
}
    func afffectValues() {
        self.emailLB.text = UserInformation.usrInfo!["email"]
        self.birthdayLB.text = UserInformation.usrInfo!["birthday"]
        self.lastNameLB.text = UserInformation.usrInfo!["lastname"]!
    }
}
