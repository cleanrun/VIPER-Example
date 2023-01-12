//
//  Dependency.swift
//  VIPER-Example
//
//  Created by cleanmac on 12/01/23.
//

import Foundation

@propertyWrapper struct Dependency<T> {
    private let keyPath: WritableKeyPath<DependencyContainer, T>

    var wrappedValue: T {
        get { DependencyContainer[keyPath] }
        set { DependencyContainer[keyPath] = newValue }
    }

    init(_ keyPath: WritableKeyPath<DependencyContainer, T>) {
        self.keyPath = keyPath
    }
}
