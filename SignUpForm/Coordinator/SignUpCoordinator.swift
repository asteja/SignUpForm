//
//  SignUpCoordinator.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import SwiftUI

public class SignUpModule {
    static let shared = SignUpModule()
    func createSignUpCoordinator() -> SignUpCoordinator {
        return SignUpCoordinatorImpl()
    }
}

public protocol SignUpCoordinator {
    func createSignUpView() -> AnyView
}

class SignUpCoordinatorImpl: SignUpCoordinator {
    func createSignUpView() -> AnyView {
        return AnyView(SignUpView())
    }
}
