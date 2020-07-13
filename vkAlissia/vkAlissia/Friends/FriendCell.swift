//
//  FriendCell.swift
//  vkAlissia
//
//  Created by Роман Колосов on 09.07.2020.
//  Copyright © 2020 Roman N. Kolosov. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var friendImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        friendImageView?.layer.cornerRadius = CGFloat(((friendImageView?.frame.size.height) ?? 0) / 2)
        friendImageView?.contentMode = .scaleAspectFill
        //friendImageView?.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
