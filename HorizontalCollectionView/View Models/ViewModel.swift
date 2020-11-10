//
//  ViewModel.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/6/20.
//

import Foundation

class ViewModel{
    var apiH = APIhandler()
    var arr: [Movie] = []
    
    func getDatafromViewModel(urlS: String, completion: @escaping ([Movie]) -> Void) {
        apiH.getDataFromAPI(urlStr: urlS) { (model, response, error) in
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
