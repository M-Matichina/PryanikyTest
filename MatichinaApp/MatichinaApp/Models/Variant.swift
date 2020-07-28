//
//  Variant.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/16/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import Foundation
import ObjectMapper

struct Variant : Mappable {
    
    // MARK: Properties
    
    var id: Int? 
    var text: String?
    
    
    
    // MARK: Init
    
    init?(map: Map) { }
    
    
    
    // MARK: Func
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        text <- map["text"]
    }
}
