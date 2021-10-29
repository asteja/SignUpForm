//
//  ConfirmView.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import SwiftUI

struct ConfirmView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State var showSignin: Bool = false
    
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
        Text("Hello, \(viewModel.user.firstName.isEmpty ? viewModel.user.firstName : "User")!")
            .font(.system(size: Constants.headerTextSize, weight: .black))
    }
    
    var helperText: some View {
        Text("Your super awesome portfolio has been successfully submitted! The details below will be public within your community!")
            .foregroundColor(Color.gray)
            .font(.system(size: Constants.bodyTextSize, weight: .regular))
    }
    
    var details: some View {
        VStack(alignment: .center, spacing: 10) {
            if !viewModel.user.website.isEmpty {
                Text("\(viewModel.user.website)")
                    .underline()
                    .foregroundColor(Color.blue)
            }
            if !viewModel.user.firstName.isEmpty {
                Text("\(viewModel.user.firstName)")
            }
            Text("\(viewModel.user.email)")
        }
        .tint(Color.black)
        .frame(maxWidth: .infinity)
        .font(.system(size: Constants.bodyTextSize, weight: .regular))
    }
    
    var signInButton: some View {
        VStack {
            NavigationLink(destination: ConfirmView(), isActive: $showSignin) { EmptyView() }
            Button("Sign In") {
                print("sign in tapped")
            }
            .primaryButtonAppearance()
        }
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView()
    }
}
