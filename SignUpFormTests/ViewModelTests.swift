//
//  ViewModelTests.swift
//  SignUpFormTests
//
//  Created by Saiteja Alle on 10/28/21.
//

import XCTest
@testable import SignUpForm

class ViewModelTests: XCTestCase {
    
    var target: ViewModel?

    override func setUpWithError() throws {
        let dataStore = ImaginaryService()
        self.target = ViewModel(dataStore: dataStore)
    }

    func testInitialState() throws {
        XCTAssertNotNil(self.target?.dataStore)
        XCTAssertEqual(self.target!.email, "")
        XCTAssertEqual(self.target!.password, "")
        XCTAssertFalse(self.target!.showLoadingIndicator)
        XCTAssertFalse(self.target!.showConfirmScreen)
        XCTAssertFalse(self.target!.signUpError)
    }
    
    func testGetHeaderText() throws {
        //Given
        self.target?.showConfirmScreen = true
        let user = User()
        //Then
        XCTAssertEqual(self.target!.getHeaderText(), "Hello, \(user.firstName.isEmpty ? "User" : user.firstName)!")
        //Given
        self.target?.showConfirmScreen = false
        //Then
        XCTAssertEqual(self.target!.getHeaderText(), "Profile Creation")
    }
    
    func testGetHelperText() throws {
        //Given
        self.target?.showConfirmScreen = true
        //Then
        XCTAssertEqual(self.target!.getHelperText(), "Your super awesome portfolio has been successfully submitted! The details below will be public within your community!")
        //Given
        self.target?.showConfirmScreen = false
        //Then
        XCTAssertEqual(self.target!.getHelperText(), "Use the form below to submit your portfolio \nAn email and password are required")
    }
    
    func testPrimaryButtonText() throws {
        //Given
        self.target?.showConfirmScreen = true
        //Then
        XCTAssertEqual(self.target!.getPrimaryButtonTitleText(), "Sign In")
        //Given
        self.target?.showConfirmScreen = false
        //Then
        XCTAssertEqual(self.target!.getPrimaryButtonTitleText(), "Submit")
    }

    func testDidTapSubmit() throws {
        //Given
        let user = User(email: "example@email.com", password: "Pas$word123")
        self.target?.user = user
        //When
        self.target?.didTapSubmit()
        //Then
        self.target?.$showConfirmScreen
            .collect(2)
            .last()
            .sink(receiveValue: { showConfirmScreenArray in
                if let showConfirmScreen =  showConfirmScreenArray.first {
                    XCTAssertTrue(showConfirmScreen)
                }
            })
            .cancel()
        self.target?.$showLoadingIndicator
            .collect(2)
            .last()
            .sink(receiveValue: { showLoadingIndicatorArray in
                if let showLoadingIndicator =  showLoadingIndicatorArray.first {
                    XCTAssertFalse(showLoadingIndicator)
                }
            })
            .cancel()
        self.target?.$signUpError
            .collect(2)
            .last()
            .sink(receiveValue: { signUpErrorArray in
                if let signUpError =  signUpErrorArray.first {
                    XCTAssertFalse(signUpError)
                }
            })
            .cancel()
    }
    
    func testDidTapSubmitForError() throws {
        //Given
        let user = User()
        self.target?.user = user
        //When
        self.target?.didTapSubmit()
        //Then
        self.target?.$signUpError
            .collect(2)
            .last()
            .sink(receiveValue: { signUpErrorArray in
                if let signUpError =  signUpErrorArray.first {
                    XCTAssertFalse(signUpError)
                }
            })
            .cancel()
        self.target?.$showConfirmScreen
            .collect(2)
            .last()
            .sink(receiveValue: { showConfirmScreenArray in
                if let showConfirmScreen =  showConfirmScreenArray.first {
                    XCTAssertFalse(showConfirmScreen)
                }
            })
            .cancel()
        self.target?.$showLoadingIndicator
            .collect(2)
            .last()
            .sink(receiveValue: { showLoadingIndicatorArray in
                if let showLoadingIndicator =  showLoadingIndicatorArray.first {
                    XCTAssertFalse(showLoadingIndicator)
                }
            })
            .cancel()
    }

}
