import UIKit
import FirebaseCore
import FirebaseAuth

class ViewController: UIViewController {
    let button = UIButton()
    
    @IBAction fileprivate func handlePresentingView(_ sender: UIButton) {
      let vc = MainViewController()
      present(vc, animated: true, completion: nil)
        vc.modalPresentationStyle = .fullScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     //   if(UserInformation.defaults)
        if(UserApi().isUserLoggedIn()){
        let firstVarXIB = Bundle.main.loadNibNamed("TableViewController", owner: nil, options: nil)?.first as! TableViewController
        firstVarXIB.frame.size = self.view.frame.size
        self.view.addSubview(firstVarXIB)
        }else {
            let secondVarXIB = Bundle.main.loadNibNamed("TableViewController", owner: nil, options: nil)?.first as! TableViewController
            secondVarXIB.frame.size = self.view.frame.size
            self.view.addSubview(secondVarXIB)
        }
    }
    func presentUiview(newView : UIView) {
        newView.frame.size = self.view.frame.size
        self.view.addSubview(newView)
    }
}
 //  var btn = UIButton()
    
//var button = UIButton()
/*    button.setTitle("push another controller", for: .normal)
//    view.addSubview(button)
    button.backgroundColor = .white
    button.setTitleColor(.black, for: .normal)
    button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    view.addSubview(button)
}
    @objc func didTapButton(){
        let tabBarVC = CustomTabBarController()
        present(tabBarVC, animated: true)
        let vc = MainViewController()
          present(vc, animated: true, completion: nil)
    }
}
*/

//        let email = "louloumkacha5@gmail.com"
//        let password = "firebase123456"
//       // Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//   //         print("errr \(error)")        }
//
//
//        button.setTitle("login", for: .normal)
//                view.addSubview(button)
//                button.backgroundColor = .blue
//                button.setTitleColor(.black, for: .normal)
//                button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
//                button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//    }
//        @objc private func didTapButton(){
//            Auth.auth().signIn(withEmail: "louloumkacha5@gmail.com", password: "firebase123456") { [weak self] authResult, error in
//              guard let strongSelf = self else { return }
//                print("userSuccessfully logined")
//                print(Auth.auth().currentUser?.email)
//            }        }
//
//}


/*
extension ViewController
{  static func loadFromNib() -> Self {
    func instantiateFromNib<T: UIViewController>() -> T {
        return T.init(nibName: String(describing: T.self), bundle: nil)
    }

    return instantiateFromNib()
}
}*/
