//
//  CertainFriendCell.swift
//  vkAlissia
//
//  Created by Роман Колосов on 11.07.2020.
//  Copyright © 2020 Roman N. Kolosov. All rights reserved.
//

import UIKit

class CertainFriendCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 10
        backView.layer.borderColor = UIColor.green.cgColor
        backView.layer.borderWidth = 3
    }
}
