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
    
    func configureCell(image: UIImage) {
        self.imgView.image = image
    }
    
    
}
