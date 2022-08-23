import UIKit

class PrincipalViewController: UIViewController {

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
            let vc3 =  UIViewController()
            let vc4 =  UIViewController()

            vc1.view.backgroundColor = .systemBlue
            vc2.view.backgroundColor = .systemPink
            vc3.view.backgroundColor = .systemGray5
            vc4.view.backgroundColor = .systemPurple
            
            vc1.tabBarItem = RAMAnimatedTabBarItem(title: "Home", image: UIImage(systemName: "house")
                                                   , tag: 1)
            (vc1.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
            vc2.tabBarItem = RAMAnimatedTabBarItem(title: "gear", image: UIImage(systemName: "gear")
                                                   , tag: 1)
            (vc2.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
            vc3.tabBarItem = RAMAnimatedTabBarItem(title: "activity", image: UIImage(systemName: "bell")
                                                   , tag: 1)
            (vc3.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
            
            setViewControllers([vc1,vc2,vc3], animated: true)
        }
        
    }
}
