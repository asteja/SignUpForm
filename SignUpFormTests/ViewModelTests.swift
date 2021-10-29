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

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialState() throws {
        XCTAssertNotNil(self.target?.dataStore)
        XCTAssertFalse(self.target!.showAlert)
        XCTAssertFalse(self.target!.showConfirmScreen)
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
    }
    
    func testDidTapSubmitForError() throws {
        //Given
        let user = User()
        self.target?.user = user
        //When
        self.target?.didTapSubmit()
        //Then
        self.target?.$showAlert
            .collect(2)
            .last()
            .sink(receiveValue: { showAlertArray in
                if let showAlert =  showAlertArray.first {
                    XCTAssertTrue(showAlert)
                }
            })
            .cancel()
    }

}
