//
//  SignUpCoordinator.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import SwiftUI

public class SignUpModule {
    func createSignUpCoordinator() -> SignUpCoordinator {
        return SignUpCoordinatorImpl()
    }
}

public protocol SignUpCoordinator {
    func createSignUpView() -> AnyView
}

class SignUpCoordinatorImpl: SignUpCoordinator {
    var viewModel: ViewModel
    
    init() {
        self.viewModel = ViewModel(dataStore: ImaginaryService())
    }
    
    func createSignUpView() -> AnyView {
        let signUpView = AnyView(SignUpView()
                                    .environmentObject(self.viewModel))
        return signUpView
    }
}
