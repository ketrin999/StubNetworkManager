//
//  NetworkManager.swift
//  StubDemo
//
//  Created by Kate  on 25.08.2024.
//

import Foundation

class RealNetworkManager: NetworkManagerProtocol {

    func getCatalogInfo(completion: @escaping ([CatalogData]) -> (), onError: @escaping (String) -> ()) {

        let urlSession = URLSession.shared
        let url = URL(string: "http://127.0.0.1:5000/catalog")!
        let request = URLRequest(url: url)

        urlSession.dataTask(with: request) { data, urlResponse, error in
            if let urlError = error as? URLError {

                switch urlError.code {
                case .timedOut: onError("Ошибка таймаута")
                default: onError("Неизвестная ошибка")
                }
            }

            if let data = data {
                let decoder = JSONDecoder()
                let dataCatalog = try? decoder.decode([CatalogData].self, from: data)

                if let dataCatalog = dataCatalog {
                    completion(dataCatalog)
                } else {
                    onError("Ошибка диссериализации")
                }
            } else {
                onError("Получена ошибка")
            }

        } .resume()

    }
}
