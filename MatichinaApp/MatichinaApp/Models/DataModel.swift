//
//  DataModel.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/16/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import Foundation
import ObjectMapper

struct DataModel: Mappable {
    
    // MARK: Properties
    
    var name: String?
    var data: DataContent?
    
    
    
    // MARK: Init
    
    init?(map: Map) { }
    
    
    
    // MARK: Func
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        data <- map["data"]
    }
}
