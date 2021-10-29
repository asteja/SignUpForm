//
//  SignUpDataStore.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import Foundation

protocol SignUpDataStore {
    func validateAccountDetails(_ user: User) async -> Result<Bool, Error>
}

class ImaginaryService: SignUpDataStore {
    func validateAccountDetails(_ user: User) async -> Result<Bool, Error> {
        await Task.sleep(2)
        return .success(validateEmail(user.email) && validatePassword(user.password))
    }
    
    private func validateEmail(_ email: String) -> Bool {
        guard !email.isEmpty else {
            return false
        }
        let regX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regX)
        return predicate.evaluate(with: email)
    }
    
    private func validatePassword(_ password: String) -> Bool {
        guard !password.isEmpty else {
            return false
        }
        let regX = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@",regX)
        return predicate.evaluate(with: password)
    }
}
