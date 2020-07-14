//
//  ShadowView.swift
//  vkAlissia
//
//  Created by Роман Колосов on 13.07.2020.
//  Copyright © 2020 Roman N. Kolosov. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.drawShadow()
    }
    
    func drawShadow() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 8
        self.layer.shadowOffset = CGSize.zero
    }
}
