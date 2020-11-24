//
//  DetailViewController.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/6/20.
//

import UIKit

class DetailViewController: UIViewController {
    var img: UIImage?
    var titl: String?
    var rele: String?
    var text: String?
    
    @IBOutlet weak var receiveImage: UIImageView!
    
    @IBOutlet weak var receiveTitle: UILabel!
    
    @IBOutlet weak var receiveRelease: UILabel!
    
    @IBOutlet weak var receiveText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        
        self.receiveImage.image = img
        self.receiveTitle.text = titl
        self.receiveRelease.text = rele
        self.receiveText.text = text
        
    }
    
    
    @IBAction func ExitDetailVC(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

   

}
