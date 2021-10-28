//
//  SignUpView.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import SwiftUI

struct SignUpView: View {

    @State var firstName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var website: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            header
            helperText
            signUpForm
            Spacer()
            submitButton
        }
        .navigationBarHidden(true)
        .padding()
    }
    
    var header: some View {
        Text("Profile Creation")
            .font(.system(size: Constants.headerTextSize, weight: .black))
    }
    
    var helperText: some View {
        Text("Use the form below to submit your portfolio \nAn email and password are required")
            .font(.system(size: Constants.bodyTextSize, weight: .light))
    }
    
    var signUpForm: some View {
        Group {
            TextField("First Name", text: $firstName)
            TextField("Email Address", text: $email)
            SecureField("Password", text: $password)
            TextField("Website", text: $website)
        }
        .foregroundColor(Color.black)
        .font(.system(size: 15, weight: .regular))
        .textFieldStyle(.roundedBorder)
    }
    
    var submitButton: some View {
        NavigationLink(destination: ConfirmView()) {
            Text("Submit")
                .primaryButtonAppearance()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
