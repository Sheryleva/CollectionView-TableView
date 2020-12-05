//
//  ProtocolToPassData.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 12/5/20.
//

import Foundation

protocol  ProtocolToPassData {
    func didReceiveData(_ data: [Movie])
    func didReceiveError(_ error: Error?)
}


