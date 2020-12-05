//
//  PopularViewModel.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 12/4/20.
//

import Foundation

class PopularViewModel{
    private var apiH = APIhandler()
    private var arr = [Movie]()
    private var page = 0
    
    func getDatafromViewModel(urlS: String, completion: @escaping ([Movie]) -> Void) {
        page += 1
        let urlString = urlS + "\(page)"
        apiH.getDataFromAPI(urlStr: urlString) { (model, response, error) in
            DispatchQueue.main.async {
                let data = model?.results
                guard let model = data else {return}
                self.arr = model
                completion(self.arr)
            }
        }
    }
    
    func getRows() -> Int {
        return arr.count
    }
}
