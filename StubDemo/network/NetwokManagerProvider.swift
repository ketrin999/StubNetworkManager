//
//  NetwokManagerProvider.swift
//  StubDemo
//
//  Created by Kate  on 31.08.2024.
//

import Foundation

class NetwokManagerProvider {
    static func getNetworkManager() -> NetworkManagerProtocol {
        #if DEBUG
        return StubNetworkManager()
        #else
        return RealNetworkManager()
        #endif
    }
}
