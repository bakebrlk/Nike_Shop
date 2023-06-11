//
//  Storage.swift
//  Nike Shop
//
//  Created by bakebrlk on 11.06.2023.
//

import Foundation

class Storage{
    @AppDataStorage(key: "welcome", defaultValue:false)
    static var checkWelcome: Bool
    
    @AppDataStorage(key: "onbording", defaultValue: false)
    static var checkOnbording: Bool
}

@propertyWrapper
struct AppDataStorage<T: Codable> {
    private let key: String
    private let defaultValue: T
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T { // generic
        get {
            guard let data = UserDefaults.standard.object(forKey: key) as? Foundation.Data else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
