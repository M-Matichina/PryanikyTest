//
//  NetworkingService.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/15/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import Foundation

class NetworkingService {
    
    private init() {}
    static let shared = NetworkingService() // Singleton
    
    public func getData(url: URL, completion: @escaping (Any) -> ()) {
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    completion(json)
                }
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
}

