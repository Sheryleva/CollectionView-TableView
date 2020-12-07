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
    var urlSession: SessionProtocol?
    
    init(delegate: ProtocolToPassData, session: SessionProtocol?) {
        self.urlSession = session
        self.delegate = delegate
    }
    
    init(delegate2: ProtocolToPassPopular, session: SessionProtocol?) {
        self.urlSession = session
        self.delegate2 = delegate2
    }
    
    func getDataFromAPI(urlStr: String) {
        let url = URL(string: urlStr)
        guard let unwrap_url = url else {
            print("Unable to decode")
            return
            
        }
        urlSession?.fetchData(url: unwrap_url) { (data, response, error) in
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
        }
    }
    
}

protocol SessionProtocol {
    func fetchData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: SessionProtocol {
    func fetchData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: url) { (data, response, error) in
            guard data != nil else
            {
                print("Data is nil")
                completion(nil, nil, error)
                return
                
            }
            completion(data,response,nil)
        }
        task.resume()
    }
}
