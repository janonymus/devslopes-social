//
//  PostCell.swift
//  devslopes-social
//
//  Created by János Csizmadia on 2/26/17.
//  Copyright © 2017 János Csizmadia. All rights reserved.
//

import UIKit
import Foundation

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        caption.setContentOffset(CGPoint.zero, animated: false)
        caption.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
    

}
