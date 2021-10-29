//
//  SignUpView.swift
//  SignUpForm
//
//  Created by Saiteja Alle on 10/28/21.
//

import SwiftUI

struct SignUpView: View {

    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            if viewModel.showLoadingIndicator && !viewModel.showConfirmScreen {
                ProgressView()
                    .tint(Color.red)
            }
            VStack(alignment: .leading, spacing: 10) {
                header
                helperText
                if viewModel.showConfirmScreen {
                    details
                }else {
                    signUpForm
                }
                Spacer()
                submitButton
            }
            .padding()
        }
        .background(viewModel.showLoadingIndicator && !viewModel.showConfirmScreen ? .gray : .white)
        .opacity(viewModel.showLoadingIndicator && !viewModel.showConfirmScreen ? 0.5 : 1)
        .navigationBarHidden(true)
    }
    
    var header: some View {
        Text(viewModel.getHeaderText())
            .font(.system(size: Constants.headerTextSize, weight: .black))
    }
    
    var helperText: some View {
        Text(viewModel.getHelperText())
            .foregroundColor(Color.gray)
            .font(.system(size: Constants.bodyTextSize, weight: .regular))
    }
    
    var signUpForm: some View {
        Group {
            TextField("First Name", text: $viewModel.user.firstName)
            TextField("Email Address", text: $viewModel.email)
            if !viewModel.email.isEmpty || viewModel.signUpError {
                Text("* Please enter valid email address")
                    .foregroundColor(viewModel.user.isEmailValid ? .green : .red)
                    .font(.system(size: Constants.bodyTextSize, weight: .regular))
            }
            SecureField("Password", text: $viewModel.password)
            if !viewModel.password.isEmpty || viewModel.signUpError {
                Text("* Atleast 8 characters contain Alphanumeric characters with symbols #?!@$%^&<>*~:`-")
                    .foregroundColor(viewModel.user.isPasswordValid ? .green : .red)
                    .font(.system(size: Constants.bodyTextSize, weight: .regular))
            }
            TextField("Website (optional)", text: $viewModel.user.website)
        }
        .background(viewModel.showLoadingIndicator ? .gray : .white)
        .opacity(viewModel.showLoadingIndicator ? 0.5 : 1)
        .font(.system(size: 15, weight: .regular))
        .textFieldStyle(.roundedBorder)
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
    
    var submitButton: some View {
        Button(viewModel.getPrimaryButtonTitleText()) {
            viewModel.signUpError = false
            viewModel.showLoadingIndicator = true
            viewModel.didTapSubmit()
        }
        .primaryButtonAppearance()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
