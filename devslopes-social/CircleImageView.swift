//
//  CircleImageView.swift
//  devslopes-social
//
//  Created by János Csizmadia on 2/26/17.
//  Copyright © 2017 János Csizmadia. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }
    
}
