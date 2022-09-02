import UIKit

class DetailView: UIView {
    @IBOutlet weak var subscritionLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var decriptionLabel: UILabel!
    override func awakeFromNib() {
        self.title.text = "titreee"
        self.subscritionLabel.text = "tttiiiiiiiiiaieiaeiazoe"
        self.decriptionLabel.text = "tttiiiiiiiiiaieiaeiazoetttiiiiiiiiiaieiaeiazoetttiiiiiiiiiaieiaeiazoetttiiiiiiiiiaieiaeiazoetttiiiiiiiiiaieiaeiazoetttiiiiiiiiiaieiaeiazoetttiiiiiiiiiaieiaeiazoetttiiiiiiiiiaieiaeiazoe"
    }
}
