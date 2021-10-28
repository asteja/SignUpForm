//
//  ConfirmView.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import SwiftUI

struct ConfirmView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            header
            helperText
            details
            Spacer()
            signInButton
        }
        .navigationBarHidden(true)
        .padding()
    }
    
    var header: some View {
        Text("Hello, Username!")
            .font(.system(size: Constants.headerTextSize, weight: .black))
    }
    
    var helperText: some View {
        Text("Your super awesome portfolio has been successfully submitted! The details below will be public within your community!")
            .foregroundColor(Color.gray)
            .font(.system(size: Constants.bodyTextSize, weight: .regular))
    }
    
    var details: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("example.com")
                .underline()
                .foregroundColor(Color.blue)
            Text("Username")
            Text("username@example.com")
        }
        .tint(Color.black)
        .frame(maxWidth: .infinity)
        .font(.system(size: Constants.bodyTextSize, weight: .regular))
    }
    
    var signInButton: some View {
        NavigationLink(destination: ConfirmView()) {
            Text("Sign In")
                .primaryButtonAppearance()
        }
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView()
    }
}
