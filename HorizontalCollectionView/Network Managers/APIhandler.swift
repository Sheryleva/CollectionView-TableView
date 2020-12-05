//
//  APIhandler.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/6/20.
//

import Foundation

class APIhandler {
    var delegate: ProtocolToPassData?
    var delegate2: ProtocolToPassPopular?
    
    init(delegate: ProtocolToPassData) {
        self.delegate = delegate
    }
    
    init(delegate2: ProtocolToPassPopular) {
        self.delegate2 = delegate2
    }
    
    func getDataFromAPI(urlStr: String) {
        let url = URL(string: urlStr)
        guard let unwrap_url = url else {
            print("Unable to decode")
            return
            
        }
        URLSession.shared.dataTask(with: unwrap_url) { (data, response, error) in
            guard error == nil else {
                print("Unable to decode")
                self.delegate?.didReceiveError(error)
                self.delegate2?.didReceiveErrorPopular(error)
                return
            }
            guard let data_unwrap = data else {return }
            do{
                let model = try JSONDecoder().decode(MoviesInfo.self, from: data_unwrap)
                self.delegate?.didReceiveData(model.results)
                self.delegate2?.didReceivePopular(model.results)
                print(model)
            }
            catch {
                print("Unable to decode")
            }
        }.resume()
    }
    
}
