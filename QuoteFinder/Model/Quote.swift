//
//  Quote.swift
//  QuoteFinder
//
//  Created by xinyu zhang on 2025-03-03.
//

import Foundation

struct Quote: Identifiable, Codable {
    
    // MARK: Stored properties
    let quoteText:String
    let quoteAuthor:String
    let id: Int
        
}
