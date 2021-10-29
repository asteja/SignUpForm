//
//  SignUpView.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import SwiftUI

struct SignUpView: View {

    @EnvironmentObject var viewModel: ViewModel
    @State var showConfirm: Bool = false

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
            TextField("First Name", text: $viewModel.user.firstName)
            TextField("Email Address (optional)", text: $viewModel.user.email)
            SecureField("Password", text: $viewModel.user.password)
            TextField("Website (optional)", text: $viewModel.user.website)
        }
        .foregroundColor(Color.black)
        .font(.system(size: 15, weight: .regular))
        .textFieldStyle(.roundedBorder)
    }
    
    var submitButton: some View {
        VStack {
            NavigationLink(destination: ConfirmView(), isActive: $showConfirm) { EmptyView() }
            Button("Submit") {
                guard !viewModel.user.email.isEmpty && !viewModel.user.password.isEmpty else {
                    return
                }
                self.showConfirm.toggle()
                viewModel.didTapSubmit()
            }
            .primaryButtonAppearance()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
