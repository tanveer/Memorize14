//
//  Emojis.swift
//  Memorize14
//
//  Created by Tanveer Bashir on 7/19/20.
//

import Foundation

struct Emoji: Codable {
    var emoji: String
}

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from resource")
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode from \(file)")
        }
        return loaded
    }
}
