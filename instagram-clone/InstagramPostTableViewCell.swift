//
//  InstagramPostTableViewCell.swift
//  instagram-clone
//
//  Created by Kinshuk Juneja on 3/13/17.
//  Copyright © 2017 CS490. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InstagramPostTableViewCell: UITableViewCell {

    @IBOutlet weak var photoView: PFImageView!
    
    @IBOutlet weak var captionlabel: UILabel!
    var instagramPost: PFObject! {
        didSet {
            self.photoView.file = instagramPost["image"] as? PFFile
            self.photoView.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
