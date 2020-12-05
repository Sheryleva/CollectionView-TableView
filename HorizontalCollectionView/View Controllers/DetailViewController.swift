//
//  DetailViewController.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/6/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var receiveImage: UIImageView!
    @IBOutlet weak var receiveTitle: UILabel!
    @IBOutlet weak var receiveRelease: UILabel!
    @IBOutlet weak var receiveText: UITextView!
    
    var movieObj = Movie()
    let imageCache = NSCache<NSString, UIImage>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        configure()
    }
    
    @IBAction func ExitDetailVC(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func configure() {
        guard let img = movieObj.image else {return }
        var image = UIImage()
        image = image.getImage(img, CGSize(width: 240, height: 300))
        self.imageCache.setObject(image, forKey: NSString(string: img))
        self.receiveImage.image = image
        self.receiveTitle.text = movieObj.title
        self.receiveRelease.text = movieObj.release
        self.receiveText.text = movieObj.overview
    }
    
    
}
