//
//  CustomTableViewCell.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/8/20.
//

import UIKit
import MBCircularProgressBar

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var relse: UILabel!
    
    @IBOutlet weak var ratng: UILabel!
    
    @IBOutlet weak var progreeRn: MBCircularProgressBarView!
    
    var progressVal: Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if progressVal > 70 {
        self.progreeRn.progressColor = UIColor.green
        }
        else if progressVal > 40 {
            self.progreeRn.progressColor = UIColor.yellow
        }
        else {
            self.progreeRn.progressColor = UIColor.red
        }
        self.progreeRn.value = CGFloat(progressVal)
        
    }
    


}

