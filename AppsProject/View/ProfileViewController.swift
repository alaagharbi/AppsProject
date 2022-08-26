import UIKit

class ProfileViewController : UIViewController {
    
    let profileViewXIB = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as! ProfileView

    override func viewDidLoad() {
        super.viewDidLoad()
        profileViewXIB.frame.size = self.view.frame.size
        self.view.addSubview(profileViewXIB)
        UserApi().getUserInformation(onSuccess: {self.afffectValues()})
        print("--------")
        print(UserInformation.defaults.bool(forKey: "email"))
        print("--------")
        profileViewXIB.editProfileBtn.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    func afffectValues() {
        self.profileViewXIB.emailLB.text = UserInformation.usrInfo!["email"]
        self.profileViewXIB.birthdayLB.text = UserInformation.usrInfo!["birthday"]
        self.profileViewXIB.lastNameLB.text = UserInformation.usrInfo!["lastname"]!
    }
    
    @objc func didTapButton(){
        UserApi().getUserInformation(onSuccess: {self.afffectValues()})
        print("--------")
        print(UserInformation.defaults.bool(forKey: "email"))
        print("--------")
    }
    func editUserProfile(_ sender: Any) {
        let firt = Bundle.main.loadNibNamed("EditProfileViewXIB", owner: nil, options: nil)?.first as! EditProfileViewXIB
        self.view.addSubview(firt)
    }
    //- Note:na9es  function edit profile w modification mta3 password TODO
    
}
