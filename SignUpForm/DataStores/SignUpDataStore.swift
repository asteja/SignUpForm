//
//  SignUpDataStore.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import Foundation

protocol SignUpDataStore {
    func validateAccountDetails(_ user: User) async -> Result<User, Error>
    func validateEmail(_ email: String) -> Bool
    func validatePassword(_ password: String) -> Bool
}

class ImaginaryService: SignUpDataStore {
    func validateAccountDetails(_ user: User) async -> Result<User, Error> {
        await Task.sleep(10000000000) // is equal to 10 seconds
        var user = user
        user.isEmailValid = validateEmail(user.email)
        user.isPasswordValid = validatePassword(user.password)
        return .success(user)
    }
    
    func validateEmail(_ email: String) -> Bool {
        guard !email.isEmpty else {
            return false
        }
        let regX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regX)
        return predicate.evaluate(with: email)
    }
    
    func validatePassword(_ password: String) -> Bool {
        guard !password.isEmpty else {
            return false
        }
        let regX = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@",regX)
        return predicate.evaluate(with: password)
    }
}
