//
//  ViewController.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/6/20.
//

import UIKit


class ViewController: UIViewController, ProtocolToPassData, ProtocolToPassPopular {
    
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    
    private var VM: ViewModel?
    var delegate: ProtocolToPassData?
    var delegate2: ProtocolToPassPopular?
    private var PopVM: PopularViewModel?
    private var arrP = [Movie]()
    private var arrNS = [Movie]()
    private var DetailVC = DetailViewController()
    private let imageCache = NSCache<NSString, UIImage>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSpinner(onView: self.view)
        VM = ViewModel(delegate: self, session: URLSession.shared)
        VM?.delegate = self
        VM?.getDatafromViewModel(urlS: movieUrl)
        
        PopVM = PopularViewModel(delegate2: self, session: URLSession.shared)
        PopVM?.delegate2 = self
        PopVM?.getDatafromViewModel(urlS: popularMoviesUrl)
        
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        collView.delegate = self
        collView.dataSource = self
        let nib = UINib(nibName: CollectionViewCell.nibName, bundle: nil)
        collView.register(nib, forCellWithReuseIdentifier: "collectionCell")
        registerNib()
        
    }
    
    func didReceiveData(_ data: [Movie]) {
        arrNS = data
        DispatchQueue.main.async {
            self.collView.reloadData()
        }
        print(arrNS)
    }
    
    func didReceiveError(_ error: Error?) {
        VM?.didReceiveError(error)
        
    }
    
    func didReceivePopular(_ data: [Movie]) {
        self.removeSpinner()
        arrP.append(contentsOf: data)
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
    }
    
    func didReceiveErrorPopular(_ error: Error?) {
        PopVM?.didReceiveErrorPopular(error)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrP.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? CustomTableViewCell
        let myObj = arrP[indexPath.row]
        cell?.configure(myObj)
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        vc?.movieObj = arrP[indexPath.row]
        navigationController?.present(vc ?? UIViewController(), animated: true)
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if tblView.contentOffset.y >= (tblView.contentSize.height - tblView.frame.size.height) {
            PopVM?.getDatafromViewModel(urlS: popularMoviesUrl)
            
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            self.tblView.tableFooterView = spinner
            self.tblView.tableFooterView?.isHidden = false
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell
        let myObj = arrNS[indexPath.row]
        cell?.configure(myObj)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        vc?.movieObj = arrNS[indexPath.row]
        navigationController?.present(vc ?? UIViewController(), animated: true)
    }
    
    func registerNib() {
        let nib = UINib(nibName: CollectionViewCell.nibName, bundle: nil)
        collView?.register(nib, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        if let flowLayout = self.collView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
}






