//
//  Quote.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 05/04/21.
//

import Foundation

class Quote : Codable{
    var text : String
    var author : String
    var permalink : String
    
    enum CodingKeys : String, CodingKey{
        case text = "quote"
        case author
        case permalink
    }
}
