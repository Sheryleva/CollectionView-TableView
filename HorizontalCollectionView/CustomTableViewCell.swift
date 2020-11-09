//
//  CustomTableViewCell.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/8/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var relse: UILabel!
    
    @IBOutlet weak var ratng: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

