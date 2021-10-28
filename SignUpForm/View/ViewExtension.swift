//
//  ViewExtension.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import SwiftUI

struct Constants {
    static let headerTextSize: CGFloat = 30
    static let bodyTextSize: CGFloat = 12
    static let buttonTextSize: CGFloat = 15
}

extension View {
    func primaryButtonAppearance() -> some View {
        self.modifier(PrimaryButtonAppearance())
    }
}

struct PrimaryButtonAppearance: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(content: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.red)
            })
            .foregroundColor(Color.white)
            .font(.system(size: Constants.buttonTextSize, weight: .semibold))
    }
}
