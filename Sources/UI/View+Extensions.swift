//
//  View+Extensions.swift
//  Weather
//
//  Created by Arnaldo Gnesutta on 2/1/23.
//

import SwiftUI

public extension View {
    func loader(isActive: Binding<Bool>) -> some View {
        modifier(LoaderViewModifier(isActive: isActive))
    }
}
