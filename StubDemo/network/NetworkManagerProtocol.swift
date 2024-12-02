//
//  NetworkManagerProtocol.swift
//  StubDemo
//
//  Created by Kate  on 31.08.2024.
//

import Foundation

protocol NetworkManagerProtocol {

    func getCatalogInfo(completion: @escaping ([CatalogData]) -> (), onError: @escaping (String) -> ())
}
