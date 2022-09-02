
import UIKit
import RAMAnimatedTabBarController

class MainViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
 let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        view.addSubview(button)
        button.backgroundColor = .systemGray
        button.center = view.center
        button.setTitle("Show Tab Bar", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc func didTapButton(){
        let tabBarVC = CustomTabBarController()
        present(tabBarVC, animated: true)
    }
}
class CustomTabBarController: RAMAnimatedTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    func configure() {
        let vc1 =  UIViewController()
        let vc2 =  UIViewController()
//        vc1.view.frame = .systemBlue
        let firstVarXIB = Bundle.main.loadNibNamed("TableViewController", owner: nil, options: nil)?.first as! TableViewController
        firstVarXIB.frame.size = self.view.frame.size
        vc1.view.addSubview(firstVarXIB)
        vc2.view.backgroundColor = .systemPink
        let secondeVarXIB = Bundle.main.loadNibNamed("TableViewController", owner: nil, options: nil)?.first as! TableViewController
        secondeVarXIB.frame.size = self.view.frame.size
        vc2.view.addSubview(secondeVarXIB)
        vc1.tabBarItem = RAMAnimatedTabBarItem(title: "book store", image: UIImage(systemName: "house")
                                               , tag: 1)
        (vc1.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
        vc2.tabBarItem = RAMAnimatedTabBarItem(title: "profile", image: UIImage(systemName: "person.fill")
                                               , tag: 1)
        (vc2.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
        
                 setViewControllers([vc1,vc2], animated: true)
    }
}


