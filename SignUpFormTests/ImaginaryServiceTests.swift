//
//  ImaginaryServiceTests.swift
//  SignUpFormTests
//
//  Created by Saiteja Alle on 10/28/21.
//

import XCTest
@testable import SignUpForm

class ImaginaryServiceTests: XCTestCase {
    
    var target: ImaginaryService?

    override func setUpWithError() throws {
        self.target = ImaginaryService()
    }

    func testvalidateEmail() throws {
        //Given
        var isValid = false
        var inValid = false
        //When
        isValid = self.target!.validateEmail("example@email.com")
        inValid = !self.target!.validateEmail("exampl.com")
        //Then
        XCTAssertTrue(isValid)
        XCTAssertTrue(inValid)
    }
    
    func testvalidatePassword() throws {
        //Given
        var isValid = false
        var inValid = false
        //When
        isValid = self.target!.validatePassword("Pas$word123")
        inValid = !self.target!.validatePassword("Password123")
        //Then
        XCTAssertTrue(isValid)
        XCTAssert(inValid)
    }
    
    func testValidateAccountDetails() {
        //Given
        Task {
            //When
            let result = await self.target?.validateAccountDetails(User())
            switch result {
            case .success(let user):
                //Then
                XCTAssertTrue(user.email.isEmpty)
                XCTAssertTrue(user.password.isEmpty)
            default:
                break
            }
        }
    }

}
