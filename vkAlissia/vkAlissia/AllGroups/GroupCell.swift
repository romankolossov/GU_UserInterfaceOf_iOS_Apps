//
//  GroupCell.swift
//  vkAlissia
//
//  Created by Роман Колосов on 19.07.2020.
//  Copyright © 2020 Roman N. Kolosov. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupAvatarView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
//        groupLabel.translatesAutoresizingMaskIntoConstraints = true
//        groupAvatarView.translatesAutoresizingMaskIntoConstraints = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
