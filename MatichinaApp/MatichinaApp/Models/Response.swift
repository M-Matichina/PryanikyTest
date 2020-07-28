//
//  Response.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/16/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import Foundation
import ObjectMapper

struct Response: Mappable {
    
    // MARK: Properties
    
    var data: [DataModel] = []
    var view: [Type] = []
    
    
    
    // MARK: Init
    
    init?(map: Map) { }
    
    
    
    // MARK: Func
    
    mutating func mapping(map: Map) {
        data <- map["data"]
        view <- map["view"]
    }
}
