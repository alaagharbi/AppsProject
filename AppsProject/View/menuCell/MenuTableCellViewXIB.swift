//
//  MenuTableCellViewXIB.swift
//  AppsProject
//
//  Created by ag mac on 24/8/2022.
//

import UIKit

class MenuTableCellViewXIB: UITableViewCell {
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var menuItemLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
