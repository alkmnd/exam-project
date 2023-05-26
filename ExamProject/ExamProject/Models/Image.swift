//
//  Image.swift
//  ExamProject
//
//  Created by 1234 on 26.05.2023.
//

import Foundation

// модель изображения (храним только ссылку)
struct ImageInfo: Codable, Hashable {
    let urls: Urls
    var liked_by_user: Bool
}

// нужно для прямого образения к ссылке (чтобы не конвертировать в строку)
struct Urls: Codable, Hashable {
    let regular: String
    var regularUrl: URL  {
        return URL(string: regular)!
    }
}
