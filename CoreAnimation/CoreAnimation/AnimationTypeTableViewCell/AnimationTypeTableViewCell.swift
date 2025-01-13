//
//  AnimationTypeTableViewCell.swift
//  CoreAnimation
//
//  Created by Archit Joshi on 07/01/25.
//

import UIKit

class AnimationTypeTableViewCell: UITableViewCell {
    @IBOutlet weak var animationTypeLabel: UILabel!
    let identifier: String = "AnimationTypeTableViewCell"
    private var coreAnimationType: CoreAnimationType = .shake
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.selectionStyle = .none
        self.setData()
    }
    
    func configure(with animationType: CoreAnimationType) {
        self.coreAnimationType = animationType
    }
    
    private func setData() {
        self.animationTypeLabel.text = self.coreAnimationType.rawValue
    }
    
}
