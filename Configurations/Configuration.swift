//
//  Configuration.swift
//  BuildConfigDemo
//
//  Created by Nazmul Islam on 29/3/21.
//

import Foundation

enum Configuration: String {
    case development = "Development"
    case production = "Production"

    static let current: Configuration = {
        guard let rawValue = Bundle.main.infoDictionary?["Configuration"] as? String else {
            fatalError("No Configuration found")
        }

        guard let configuration = Configuration(rawValue: rawValue) else {
            fatalError("Invalid Configuration Name")
        }

        return configuration
    }()

    static var baseURL: URL {
        switch current {
            case .development:
                return URL(string: "api.staging.example.com")!
            case .production:
                return URL(string: "api.example.com")!
        }
    }

    static var apiKey: String {
        switch current {
            case .development:
                return "1234"
            case .production:
                return "super_secret"
        }
    }
}
