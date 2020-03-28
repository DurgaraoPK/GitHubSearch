//
//  RepositoryCellTableViewCell.swift
//  SampleMVC
//
//  Created by DURGA RAO on 27/03/20.
//  Copyright © 2020 DURGA RAO. All rights reserved.
//

import UIKit

class RepositoryCellTableViewCell: UITableViewCell {

    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblFullName: UILabel!
    @IBOutlet var lblWatchCount: UILabel!
    @IBOutlet var lblCommitCount: UILabel!
    @IBOutlet var ImageLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
