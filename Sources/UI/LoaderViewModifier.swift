//
//  CCLoaderViewModifier.swift
//  Weather
//
//  Created by Arnaldo Gnesutta on 2/1/23.
//

import SwiftUI

public struct LoaderViewModifier: ViewModifier {

    @Binding private var isActive: Bool

    public init(isActive: Binding<Bool>) {
        _isActive = isActive
    }

    public func body(content: Content) -> some View {
        ZStack {
            content
            if isActive {
                ZStack {
                    Color.black.opacity(0.75)
                    CCLoaderView(isAnimating: $isActive)
                }
                .animation(.interactiveSpring(), value: isActive)
            }
        }
    }

}

struct CCLoaderView: View {
    @Binding var isAnimating: Bool
}

extension CCLoaderView {

    var body: some View {
        ZStack {
            Color.white.opacity(90.0)
            CCProgressView($isAnimating, style: .large)
                .accentColor(.black)
                .padding(.all, 10)
        }
        .fixedSize()
        .cornerRadius(10)
    }

}

public struct CCProgressView: View {
    @State private var accentColor: Color = .gray
    @Binding private var isAnimating: Bool
    private let style: UIActivityIndicatorView.Style

    public init(_ animate: Binding<Bool> = .constant(true), style: UIActivityIndicatorView.Style = .large) {
        _isAnimating = animate
        self.style = style
    }
}

public extension CCProgressView {
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: accentColor))
        }
    }
    
}

public extension CCProgressView {
    func accentColor(_ color: Color) -> Self {
        var view = self
        view._accentColor = State(wrappedValue: color)

        return view
    }

}
