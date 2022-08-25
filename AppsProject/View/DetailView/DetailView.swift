import UIKit

class DetailView: UIView {
    @IBOutlet weak var subscritionLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBAction func returnBtn(_ sender: UIButton) {
        let firt = Bundle.main.loadNibNamed("DetailView", owner: nil, options: nil)?.first as! DetailView
        self.addSubview(firt)
    }
    override func awakeFromNib() {
        title.text = "titreee"
    }
}
