//
//  ViewModel.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/6/20.
//

import Foundation

class ViewModel: ProtocolToPassData {
    
    private var apiH: APIhandler?
    var delegate: ProtocolToPassData?
    
    init(delegate: ProtocolToPassData) {
        apiH = APIhandler.init(delegate: self)
    }
    
    func getDatafromViewModel(urlS: String) {
        apiH?.getDataFromAPI(urlStr: urlS)
    }
    
    func didReceiveData(_ data: [Movie]) {
        self.delegate?.didReceiveData(data)
    }
    
    func didReceiveError(_ error: Error?) {
        self.delegate?.didReceiveError(error)
    }
    
}
