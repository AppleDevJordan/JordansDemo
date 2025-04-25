//
//  Country.swift
//  JordansDemo
//
//  Created by Jordan McKnight on 4/25/25.
//


import Foundation

struct Country: Decodable {
    let capital: String
    let code: String
    let currency: Currency
    let flag: String
    let language: Language
    let name: String
    let region: String
}

struct Currency: Decodable {
    let code: String
    let name: String
    let symbol: String?  // Handles null values
}

struct Language: Decodable {
    let code: String?    // Handles null values
    let name: String
}
