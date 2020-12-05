//
//  APIhandler.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/6/20.
//

import Foundation

struct APIhandler {
    
    func getDataFromAPI(urlStr: String, completion: @escaping (MoviesInfo?, URLResponse?, Error?)-> Void) {
        let url = URL(string: urlStr)
        guard let unwrap_url = url else {
            print("Unable to decode")
            return}
        URLSession.shared.dataTask(with: unwrap_url) { (data, response, error) in
            guard error == nil else {
                print("Unable to decode")
                completion(nil,response,error)
                return
            }
            guard let data_unwrap = data else {return }
            do{
                let model = try JSONDecoder().decode(MoviesInfo.self, from: data_unwrap)
                completion(model,response,nil)
            }
            catch {
                print("Unable to decode")
            }
        }.resume()
    }
    
}
