//
//  News.swift
//  Final
//
//  Created by Dias Karimov on 21.05.2022.
//

import Foundation

struct News: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String?
    let url: String?
}
