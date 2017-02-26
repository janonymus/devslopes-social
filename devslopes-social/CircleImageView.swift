//
//  CircleImageView.swift
//  devslopes-social
//
//  Created by János Csizmadia on 2/26/17.
//  Copyright © 2017 János Csizmadia. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {



    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
    
}
