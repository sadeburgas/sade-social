//
//  PostCell.swift
//  sade-social
//
//  Created by sade on 6/7/17.
//  Copyright © 2017 sade. All rights reserved.
//

import UIKit
import Firebase

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    
    var post: Post!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(post: Post, img: UIImage? = nil) {
        
        self.post = post
        self.caption.text = post.caption
        self.likesLbl.text = "\(post.likes)"
        
        if img != nil {
            self.postImg.image = img
        } else {
            let ref = Storage.storage().reference(forURL: post.imageUrl)
            let maxSize: Int64 = 2 * 1024 * 1024
                ref.getData(maxSize: maxSize, completion: { (data, error)in
                    if error != nil {
                        print("DILYAN: Unable to download image from Firebasa storage.")
                } else {
                    print("DILYAN: Image download from Firebase storage.")
                    if let imgData = data {
                        if let img = UIImage(data: imgData) {
                            self.postImg.image = img
                            FeedVC.imageCache.setObject(img, forKey: post.imageUrl as NSString)
                        }
                    }
                }
            })
            
            
        }
        
    }

   

}
