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
    
    func configure(_ movie: Movie) {
        guard let ratin = movie.vote_average else {return}
        let rating = "Rating: " + "\(ratin)"
        guard let Votes = movie.vote_average else {return}
        guard let img = movie.image else {return}
        var image = UIImage()
        image = image.getImage(img, CGSize(width: 80, height: 128))
        imgView?.image = image
        title.text = movie.title
        relse.text = movie.release
        ratng.text = rating
        progressVal = Int(Votes * 10)
    }
    
    
    
    
    
    
}

