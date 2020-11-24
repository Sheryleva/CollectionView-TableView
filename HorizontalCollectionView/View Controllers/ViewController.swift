//
//  ViewController.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/6/20.
//

import UIKit


class ViewController: UIViewController {
    
    var VM = ViewModel()
    var arrP: [Movie] = []
    var arrNS: [Movie] = []
    var DetailVC = DetailViewController()
    let imageCache = NSCache<NSString, UIImage>()
    
    @IBOutlet weak var collView: UICollectionView!
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        collView.delegate = self
        collView.dataSource = self
        let nib = UINib(nibName: CollectionViewCell.nibName, bundle: nil)
        collView.register(nib, forCellWithReuseIdentifier: "collectionCell")
        getPopularMovies()
        getNowPlayingMovies()
        registerNib()
    }
    
    
    func getPopularMovies() {
        VM.getDatafromViewModel(urlS: "https://api.themoviedb.org/3/movie/popular?api_key=6a24c2c42cad80dbfc4195f6bb695d57&language=en-US&page=1") {
            model in
            DispatchQueue.main.async {
                self.arrP = model
                self.tblView.reloadData()
            }
        }
    }
    
    func getNowPlayingMovies() {
        VM.getDatafromViewModel(urlS: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=undefined&api_key=55957fcf3ba81b137f8fc01ac5a31fb5") {
            model in
            DispatchQueue.main.async {
                self.arrNS = model
                self.collView.reloadData()
            }
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrP.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! CustomTableViewCell
        guard let name = arrP[indexPath.row].title else {return UITableViewCell()}
        guard let release = arrP[indexPath.row].release else {return UITableViewCell()}
        guard let ratin = arrP[indexPath.row].vote_average else {return UITableViewCell()}
        let rating = "Rating: " + "\(ratin)"
        print(rating)
        guard let Votes = arrP[indexPath.row].vote_average else {return UITableViewCell()}
        guard let img = arrP[indexPath.row].image else {return UITableViewCell()}
        let urlS = "https://image.tmdb.org/t/p/w500" + img
        let url = URL(string: urlS)
        guard let unwrap_url = url else {return UITableViewCell()}
        guard let imageData = try? Data(contentsOf: unwrap_url) else {return UITableViewCell()}
        let image = UIImage(data: imageData)
        guard var imge = image else {return UITableViewCell()}
        imge = resizeImage(image: imge, targetSize: CGSize(width: 80, height: 128))
        self.imageCache.setObject(imge, forKey: NSString(string: img))
        cell.title.text = name
        cell.imageView?.image = imge
        cell.relse.text = release
        cell.ratng.text = rating
        cell.progressVal = Int(Votes * 10)
        return cell 
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let name = arrP[indexPath.row].title else {return }
        guard let release = arrP[indexPath.row].release else {return }
        guard let ratin = arrP[indexPath.row].vote_average else {return }
        let rating = "Rating: " + "\(ratin)"
        print(rating)
        guard let img = arrP[indexPath.row].image else {return }
        let urlS = "https://image.tmdb.org/t/p/w500" + img
        let url = URL(string: urlS)
        guard let unwrap_url = url else {return }
        guard let imageData = try? Data(contentsOf: unwrap_url) else {return }
        let image = UIImage(data: imageData)
        guard var imge = image else {return }
        imge = resizeImage(image: imge, targetSize: CGSize(width: 240, height: 300))
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.img = imge
        vc.titl = name
        vc.rele = release
        vc.text = arrP[indexPath.row].overview

        navigationController?.present(vc, animated: true)
        
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier,
                                                         for: indexPath) as? CollectionViewCell {
            
            guard let img = arrNS[indexPath.row].image else {return UICollectionViewCell()}
            let urlS = "https://image.tmdb.org/t/p/w500" + img
            let url = URL(string: urlS)
            guard let unwrap_url = url else {return UICollectionViewCell()}
            guard let imageData = try? Data(contentsOf: unwrap_url) else { return UICollectionViewCell() }
            let image = UIImage(data: imageData)
            guard var imge = image else {return UICollectionViewCell()}
            imge = resizeImage(image: imge, targetSize: CGSize(width: 128, height: 200))
            self.imageCache.setObject(imge, forKey: NSString(string: img))
            cell.configureCell(image: imge)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let name = arrP[indexPath.row].title else {return }
        guard let release = arrP[indexPath.row].release else {return }
        guard let ratin = arrP[indexPath.row].vote_average else {return }
        let rating = "Rating: " + "\(ratin)"
        print(rating)
        guard let img = arrP[indexPath.row].image else {return }
        let urlS = "https://image.tmdb.org/t/p/w500" + img
        let url = URL(string: urlS)
        guard let unwrap_url = url else {return }
        guard let imageData = try? Data(contentsOf: unwrap_url) else {return }
        let image = UIImage(data: imageData)
        guard var imge = image else {return }
        imge = resizeImage(image: imge, targetSize: CGSize(width: 240, height: 300))
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.img = imge
        vc.titl = name
        vc.rele = release
        vc.text = arrP[indexPath.row].overview
        
        navigationController?.present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell: CollectionViewCell = Bundle.main.loadNibNamed(CollectionViewCell.nibName,
                                                                      owner: self,
                                                                      options: nil)?.first as? CollectionViewCell else {
            return CGSize.zero
        }
        guard let img = arrNS[indexPath.row].image else {return CGSize()}
        let urlS = "https://image.tmdb.org/t/p/w500" + img
        let url = URL(string: urlS)
        guard let unwrap_url = url else {return CGSize()}
        guard let imageData = try? Data(contentsOf: unwrap_url) else { return CGSize() }
        let image = UIImage(data: imageData)
        guard var imge = image else {return CGSize()}
        imge = resizeImage(image: imge, targetSize: CGSize(width: 128, height: 200))
        cell.configureCell(image: imge)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: size.width, height: size.height)
    }
    
    func registerNib() {
        let nib = UINib(nibName: CollectionViewCell.nibName, bundle: nil)
        collView?.register(nib, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        if let flowLayout = self.collView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}





