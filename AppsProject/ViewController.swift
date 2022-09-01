import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth
import SideMenu

import RxCocoa
import RxSwift
import Alamofire
import AlamofireImage


class ViewController: UIViewController {
    
    
//    var sideMenuNC :  SideMenuNavigationController!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//
//        sideMenuConfig()
//
//    }
//
//    func sideMenuConfig(){
//
//        let sideMenuVC = UIViewController()
//        sideMenuVC.view.backgroundColor = .systemBlue   // zedaa njareb .systemblue
//        sideMenuNC = .init(rootViewController: MenuListController())
//        sideMenuNC.leftSide = true
//        sideMenuNC.statusBarEndAlpha = 0
//        sideMenuNC.isNavigationBarHidden = true
//        sideMenuNC.menuWidth = view.bounds.width * 0.8
//
//    }
//    @IBAction func sideMenuAction(_ sender: UIBarButtonItem) {
//        self.present(sideMenuNC, animated: true)
//    }
//
//
//}
//class MenuListController: UITableViewController {
//    var items = [0:["name":"home","image":"homekit","controllerName":"ViewConroller"],1:["name":"profile", "image":"person.fill", "controllerName": "ProfileConroller"]]
//
//    var menuItem = [String : Dictionary<String,String>] ()
//    var menuItemDetail = [String : String] ()
//
//    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.backgroundColor = .systemGray6
//        tableView.register(UINib(nibName: "MenuTableCellViewXIB", bundle: nil), forCellReuseIdentifier: "menuCell")
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//
//    func intrfaceNavigation(controllerName:String){
//        if (controllerName == "HomeController"){
//           self.present(MainViewController(), animated: true)
//
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableCellViewXIB
//        cell.imageLabel.image = UIImage(systemName: items[indexPath.row]!["image"]!)
//        cell.menuItemLable?.text = items[indexPath.row]!["name"]
//        cell.backgroundColor = .systemGray6
//        cell.menuItemLable?.textColor = .systemBlue
//        return cell
//    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//        if (indexPath.item == 0){
//            intrfaceNavigation(controllerName: "HomeController")
//        }
//        print(indexPath.item)
//
//    }
//}
//
    
    
    
    
    
    
    
    
    
    ///////////////////
    

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



/// note: fsaffafa











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




///////

/*


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


*/


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
