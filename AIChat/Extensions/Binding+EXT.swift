//
//  Binding+EXT.swift
//  AIChat
//
//  Created by Nikita Tsomuk on 16.01.2025.
//

import SwiftUI

extension Binding where Value == Bool {
    
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
                
            }
        }
    }
}
