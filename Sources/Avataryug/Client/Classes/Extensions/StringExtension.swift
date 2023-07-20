//
//  StringExtension.swift
//  SDKClientSwift
//
//  Created by Developer1 on 18/07/23.
//

import Foundation

extension Encodable {
    var stringified: String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Decodable {
    static func from(jsonString: String) -> Self? {
        guard let data = jsonString.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        do {
            let instance = try decoder.decode(Self.self, from: data)
            return instance
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
