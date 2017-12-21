//
//  TableViewCell.swift
//  liverpool
//
//  Created by Erick Cienfuegos on 12/20/17.
//  Copyright © 2017 Erick Cienfuegos. All rights reserved.
//

import UIKit



class TableViewCell: UITableViewCell {

    @IBOutlet var imageview: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
