//
//  DataAPIError.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

enum DataAPIError: Error {
    case getDataError
    case wrongURL
}

extension DataAPIError: CustomStringConvertible {
    var description: String {
        switch self {
        case .getDataError:
            return ""
            
        case .wrongURL:
            return ""
        }
    }
}
