//
//  ViewModel.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import Combine

class ViewModel: ObservableObject {
    @Published var user: User = User()
    @Published var showAlert = false
    @Published var showConfirmScreen = false
    var dataStore: SignUpDataStore
    
    init(dataStore: SignUpDataStore) {
        self.dataStore = dataStore
    }
    
    func didTapSubmit() {
        Task {
            let result = await dataStore.validateAccountDetails(user)
            switch result {
            case .success(let user):
                if user.isEmailValid && user.isPasswordValid {
                    self.user = user
                    await self.setShowConfirmScreen(true)
                }else {
                    await self.setSignUpError(true)
                }
            case .failure(_):
                await self.setSignUpError(true)
            }
        }
    }
    
    @MainActor func setSignUpError(_ showAlert: Bool) {
        self.showAlert = showAlert
    }
    
    @MainActor func setShowConfirmScreen(_ showConfirmScreen: Bool) {
        self.showConfirmScreen = showConfirmScreen
    }
}
