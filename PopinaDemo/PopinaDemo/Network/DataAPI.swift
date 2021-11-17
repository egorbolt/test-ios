//
//  DataAPI.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import Foundation


final class DataAPI {
    private let initialURL: String
    
    init(initialURL: String) {
        self.initialURL = initialURL
    }
    
    func getData<ReturnType: Codable>(
        of type: ReturnType.Type,
        httpMethod: HTTPMethod,
        completion: @escaping (Result<ReturnType, Error>) -> ()
    ) {
        guard let url = URL(string: initialURL) else {
            completion(.failure(DataAPIError.wrongURL))
            return
        }
        
        DispatchQueue.global().async {
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod.rawValue
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(DataAPIError.wrongURL))
                    return
                }
                
                guard let result = try? JSONDecoder().decode(type, from: data) else {
                    completion(.failure(DataAPIError.wrongURL))
                    return
                }
                
                completion(.success(result))
            }
            task.resume()
        }
    }
}
