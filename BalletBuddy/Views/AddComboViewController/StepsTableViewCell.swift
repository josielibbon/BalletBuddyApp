//
//  StepsTableViewCell.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//

import UIKit

class StepsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 15)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
    }

    func setup(model: StepModel){
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }

}
