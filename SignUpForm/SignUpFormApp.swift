//
//  SignUpFormApp.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import SwiftUI

@main
struct SignUpFormApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                let signUpCoordinator = SignUpModule.shared.createSignUpCoordinator()
                signUpCoordinator.createSignUpView()
            }
        }
    }
}
