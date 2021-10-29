//
//  User.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var email = ""
    var password = ""
    var website = ""
    var isCredentialValid = false
}
