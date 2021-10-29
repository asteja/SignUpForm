//
//  ViewModel.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import Combine

class ViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var website = ""
    @Published var showConfirmScreen = false
    @Published var showLoadingIndicator: Bool = false
    @Published var signUpError: Bool = false
    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    var dataStore: SignUpDataStore
    private var bag = Set<AnyCancellable>()
        
    init(dataStore: SignUpDataStore) {
        self.dataStore = dataStore
        self.$email
            .removeDuplicates()
            .sink { email in
                self.isEmailValid = dataStore.validateEmail(email)
            }
            .store(in: &bag)
        self.$password
            .removeDuplicates()
            .sink { password in
                self.isPasswordValid = dataStore.validatePassword(password)
            }
            .store(in: &bag)
    }
    
    func getHeaderText() -> String {
        if showConfirmScreen {
            return "Hello, \(firstName.isEmpty ? "User" : firstName)!"
        }else {
            return "Profile Creation"
        }
    }
    
    func getHelperText() -> String {
        if showConfirmScreen {
            return "Your super awesome portfolio has been successfully submitted! The details below will be public within your community!"
        }else {
            return "Use the form below to submit your portfolio \nAn email and password are required"
        }
    }
    
    func getPrimaryButtonTitleText() -> String {
        if showConfirmScreen {
            return "Sign In"
        }else {
            return "Submit"
        }
    }
    
    func didTapSubmit() {
        Task {
            let user = User(firstName: self.firstName,
                            email: self.email,
                            password: self.password,
                            website: self.website)
            let result = await dataStore.validateAccountDetails(user)
            await self.handleServiceResponse(result: result)
        }
    }

    @MainActor func handleServiceResponse(result: Result<User, Error>) {
        switch result {
        case .success(let user):
            self.showLoadingIndicator = false
            self.firstName = user.firstName
            self.email = user.email
            self.password = user.password
            self.website = user.website
            if self.isEmailValid && self.isPasswordValid {
                self.showConfirmScreen = true
            }else {
                self.signUpError = true
            }
        case .failure(_):
            self.showLoadingIndicator = false
            self.signUpError = true
        }
    }
}
