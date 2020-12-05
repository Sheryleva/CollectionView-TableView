//
//  MyExtensions.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 12/4/20.
//

import Foundation
import UIKit

private var vSpinner: UIView?

extension UIViewController {
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

extension UIImage {
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func getImage(_ img: String, _ dimensions: CGSize) -> UIImage {
        let urlS = dowloadURL + img
        let url = URL(string: urlS)
        guard let unwrap_url = url else {return UIImage()}
        guard let imageData = try? Data(contentsOf: unwrap_url) else {return UIImage()}
        let image = UIImage(data: imageData)
        guard var imge = image else {return UIImage()}
        imge = imge.resizeImage(image: imge, targetSize: dimensions)
        return imge
    }
}

