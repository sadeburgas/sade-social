//
//  PostCell.swift
//  sade-social
//
//  Created by sade on 6/7/17.
//  Copyright © 2017 sade. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImag: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    @IBOutlet weak var likesImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

   

}
