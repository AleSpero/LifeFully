//
//  QuotesResponse.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 05/04/21.
//

import Foundation

class QuotesResponse : Codable{
    let contents : QuoteContent
    
    enum CodingKeys : String, CodingKey{
        case contents
    }
}


class QuoteContent : Codable {
    let quotes : [Quote]
    
    enum CodingKeys : String, CodingKey{
        case quotes
    }
}
