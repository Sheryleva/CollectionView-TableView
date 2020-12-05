//
//  CollectionViewCell.swift
//  HorizontalUICollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 9/24/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class var reuseIdentifier: String {
        return "CollectionViewCellReuseIdentifier"
    }
    class var nibName: String {
        return "CollectionViewCell"
    }
    
    func configure(_ movie: Movie) {
        guard let img = movie.image else {return}
        var image = UIImage()
        image = image.getImage(img, CGSize(width: 128, height: 200))
        imgView?.image = image
        
    }
    
    
}
