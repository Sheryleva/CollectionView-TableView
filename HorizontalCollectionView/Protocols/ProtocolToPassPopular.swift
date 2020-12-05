//
//  ProtocolToPassPopular.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 12/5/20.
//

import Foundation

protocol  ProtocolToPassPopular {
    func didReceivePopular(_ data: [Movie])
    func didReceiveErrorPopular(_ error: Error?)
}
