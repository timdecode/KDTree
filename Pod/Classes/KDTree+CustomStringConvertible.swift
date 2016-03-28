//
//  KDTree+CustomStringConvertible.swift
//  Pods
//
//  Created by Konrad Feiler on 28/03/16.
//
//

import Foundation

extension KDTree : CustomStringConvertible, CustomDebugStringConvertible {
    
    /// A textual representation of `self`.
    public var description: String {
        switch self {
        case .Leaf:
            return ","
        case let .Node(left, value, _, right):
            return left.description + String(value) + right.description
        }
    }
    
    /// A textual representation of `self`, suitable for debugging.
    public var debugDescription: String {
        switch self {
        case .Leaf:
            return ","
        case let .Node(left, value, _, right):
            return "[ \(left.debugDescription) \(String(value)) \(right.debugDescription)]"
        }
    }
}
