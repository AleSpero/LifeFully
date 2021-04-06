//
//  QuoteAPI.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 05/04/21.
//

import Foundation
import Alamofire

class QuoteAPI{
    static let baseUrl = "https://quotes.rest/qod"
    
    static func getRandomQuote(completion: (Quote) -> Void){
        AF.request(try! baseUrl.asURL(), parameters: ["category" : "positive"], headers: HTTPHeaders([HTTPHeader.accept("application/json")])).response(completionHandler: { response in
            //TODO call completion here, parse response first
        })
    }
}
