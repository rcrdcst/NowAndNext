//
//  NowAndNextTableViewCell.swift
//  NowAndNext
//
//  Created by ricardo silva on 20/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import UIKit
import Kingfisher

class NowAndNextTableViewCell: UITableViewCell {


    @IBOutlet weak var programName: UILabel!
    @IBOutlet weak var nextProgram: UILabel!
    @IBOutlet weak var coverImg: UIImageView!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(url: String) {
        let urlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        coverImg.kf.setImage(with: URL(string: urlString!), placeholder: UIImage(named: "Placeholder"))
    }
    
    
}

