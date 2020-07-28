//
//  DataManager.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/17/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import Foundation
import ObjectMapper

class DataManager {
    
    private init() {}
    
    static func getContent(completion: @escaping(Response?) -> ()) {
        guard let url = URL(string: "https://pryaniky.com/static/json/sample.json") else { return }
        
        NetworkingService.shared.getData(url: url) { (json) in
            do {
                if let json = json as? [String: Any] {
                    let response = Response(JSON: json)
                    completion(response)
                }
            }
        }
    }

}
