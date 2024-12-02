//
//  StubNetworkManager.swift
//  StubDemo
//
//  Created by Kate  on 31.08.2024.
//

import Foundation

class StubNetworkManager: NetworkManagerProtocol {

    func getCatalogInfo(completion: @escaping ([CatalogData]) -> (), onError: @escaping (String) -> ()) {
        let catalogData: [CatalogData] = [
            CatalogData(id: 1, name: "Аксессуары (Заглушка)"),
            CatalogData(id: 2, name: "Верхняя одежда (Заглушка)")
        ]

        completion(catalogData)
    }


}
