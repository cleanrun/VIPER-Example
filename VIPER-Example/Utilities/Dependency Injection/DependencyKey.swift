//
//  DependencyKey.swift
//  VIPER-Example
//
//  Created by cleanmac on 12/01/23.
//

import Foundation

public protocol DependencyKey {
    associatedtype Value

    static var currentValue: Self.Value { get set }
}
