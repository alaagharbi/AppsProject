import UIKit

class SingleTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        productImage.layer.cornerRadius = 10.0
        productImage.layer.masksToBounds = true

        cellView.layer.cornerRadius = 1.0
        cellView.layer.masksToBounds = true
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
