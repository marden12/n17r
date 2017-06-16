//
//  Word.swift
//  mApp
//
//  Created by Dayana Marden on 16.06.17.
//  Copyright © 2017 Dayana Marden. All rights reserved.
//

import Foundation
import ObjectMapper

struct Word: Mappable {
    var text = ""
    var synonyms: [String] = []
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        text <- map["text"]
        synonyms <- map["synonyms"]
    }
}
