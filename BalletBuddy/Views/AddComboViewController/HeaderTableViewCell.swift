//
//  HeaderTableViewCell.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
    }
    func setup(model: ComboModel){
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }

}
