//
//  AppColor.swift
//  Cookcademy
//
//  Created by Michał Gerlach on 23/07/2022.
//

import SwiftUI
import Foundation

//public protocol RawRepresentable {
//    associatedtype RawValue
//    init?(rawValue: Self.RawValue)
//    var rawValue: Self.RawValue { get }
//}

struct AppColor {
    
    static let background = Color(.sRGB, red: 228 / 255, green: 235 / 255, blue: 250 / 255, opacity: 1)
    static let foreground = Color(.sRGB, red: 118 / 255, green: 119 / 255, blue: 231 / 255, opacity: 1)
//    static let main = Color.gray
}

extension Color: RawRepresentable {
    public init?(rawValue: String) {
        do {
            let encodedData = rawValue.data(using: .utf8)!
            let components = try JSONDecoder().decode([Double].self, from: encodedData)
            self = Color(red: components[0], green: components[1], blue: components[2], opacity: components[3])
        }
        catch {
            return nil
        }
    }
    
    public var rawValue: String {
        guard let cgFloatComponents = UIColor(self).cgColor.components else
        { return "" }
        let doubleComponents = cgFloatComponents.map {Double($0)}
        do {
            let encodedComponents = try JSONEncoder().encode(doubleComponents)
            return String(data: encodedComponents, encoding: .utf8) ?? ""
        }
        catch {
            return ""
        }
    }
}
