//
//  ViewModel.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/6/20.
//

import Foundation

class ViewModel: ProtocolToPassData {
    
    var apiH: APIhandler?
    var urlSession: SessionProtocol?
    var delegate: ProtocolToPassData?
    
    init(delegate: ProtocolToPassData, session: SessionProtocol?) {
        self.urlSession = session
        apiH = APIhandler.init(delegate: self, session: urlSession)
    }
    
    func getDatafromViewModel(urlS: String) {
        self.apiH?.getDataFromAPI(urlStr: urlS)
    }
    
    func didReceiveData(_ data: [Movie]) {
        self.delegate?.didReceiveData(data)
    }
    
    func didReceiveError(_ error: Error?) {
        self.delegate?.didReceiveError(error)
    }
    
}
