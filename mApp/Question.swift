//
//  Question.swift
//  mApp
//
//  Created by Dayana Marden on 16.06.17.
//  Copyright © 2017 Dayana Marden. All rights reserved.
//

import Foundation
import ObjectMapper


struct Question: Mappable {
    var text = ""
    var level = 0
    var words: [Word] = []
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        text <- map["text"]
        level <- map["level"]
        words <- map["words"]
    }
}
