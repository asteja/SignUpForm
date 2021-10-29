//
//  ViewModel.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import Foundation

class ViewModel: ObservableObject {
    var user: User = User()
    var dataStore: SignUpDataStore
    
    init(dataStore: SignUpDataStore) {
        self.dataStore = dataStore
    }
    
    func didTapSubmit() {
        Task {
            let result = await dataStore.validateAccountDetails(user)
            switch result {
            case .success(let isValid):
                self.user.isCredentialValid = isValid
            default:
                break
            }
        }
    }
}
