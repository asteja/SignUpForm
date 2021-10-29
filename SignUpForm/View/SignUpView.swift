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
        .alert("PLease enter valid user name and password",
               isPresented: $viewModel.showAlert,
               actions: {
        })
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
            TextField("Email Address", text: $viewModel.user.email)
            SecureField("Password", text: $viewModel.user.password)
            TextField("Website (optional)", text: $viewModel.user.website)
        }
        .foregroundColor(Color.black)
        .font(.system(size: 15, weight: .regular))
        .textFieldStyle(.roundedBorder)
    }
    
    var submitButton: some View {
        VStack {
            NavigationLink(destination: ConfirmView()
                            .environmentObject(viewModel),
                           isActive: $viewModel.showConfirmScreen) { EmptyView() }
            Button("Submit") {
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
