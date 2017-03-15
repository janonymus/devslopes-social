//
//  PostCell.swift
//  devslopes-social
//
//  Created by János Csizmadia on 2/26/17.
//  Copyright © 2017 János Csizmadia. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    
    var post : Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        caption.setContentOffset(CGPoint.zero, animated: false)
        caption.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
    func configureCell(post: Post, img: UIImage? = nil) {
        
        self.post=post
        
        self.caption.text = post.caption
        self.likesLabel.text = "\(post.likes)"
        
        if img != nil {
            self.postImg.image = img
        } else {
            
            let ref = FIRStorage.storage().reference(forURL: self.post.imageURl)
            ref.data(withMaxSize: 2 * 1024 * 1024, completion : { (data,error) in
                
                if error != nil {
                    
                    print("JANO: Unable to download image from Firebase storage")
                } else {
                    
                    print("JANO: Image downloaded from Firebase storage")
                    if let imgData = data {
                        if let img = UIImage(data: imgData){
                            self.postImg.image = img
                            FeedVC.imageCache.setObject(img, forKey: self.post.imageURl as NSString)
                        }
                    }
                }
            })
            
            
        }
        
    }

}
