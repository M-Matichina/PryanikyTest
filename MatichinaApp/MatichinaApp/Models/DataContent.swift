//
//  DataContent.swift
//  MatichinaApp
//
//  Created by Мария Матичина on 7/16/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import Foundation
import ObjectMapper

struct DataContent: Mappable {
    
    // MARK: Properties
    
    var text: String?
    var url: String?
    var selectedId: Int?
    var variants: [Variant] = []
    
    
    
    // MARK: Init
    
    init?(map: Map) { }
    
    
    
    // MARK: Func
    
    mutating func mapping(map: Map) {
        text <- map["text"]
        url <- map["url"]
        selectedId <- map["selectedId"]
        variants <- map["variants"]
    }
}
