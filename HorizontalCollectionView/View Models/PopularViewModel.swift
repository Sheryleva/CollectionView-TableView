//
//  PopularViewModel.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 12/4/20.
//

import Foundation

class PopularViewModel: ProtocolToPassPopular {
    
    private var apiH: APIhandler?
    var delegate2: ProtocolToPassPopular?
    private var page = 0
    
    init(delegate2: ProtocolToPassPopular) {
        apiH = APIhandler.init(delegate2: self)
    }
    
    func getDatafromViewModel(urlS: String) {
        page += 1
        let urlString = urlS + "\(page)"
        apiH?.getDataFromAPI(urlStr: urlString)
    }
    
    func didReceivePopular(_ data: [Movie]) {
        self.delegate2?.didReceivePopular(data)
    }
    
    func didReceiveErrorPopular(_ error: Error?) {
        self.delegate2?.didReceiveErrorPopular(error)
    }
    
}
