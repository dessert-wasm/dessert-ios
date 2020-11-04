//dessert_iosTests.swift created on 28/06/2020.

import XCTest
@testable import dessert_ios

class dessert_iosTests: XCTestCase {
    // We test the Helper class of the dessert IOS app
    var sut: Helper!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = Helper()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    func testDateParsingValid() throws {
        let date = "T.15141210"
        let res = Helper.parseDate(dateToParse: date)
        
        print("valid", res)
        XCTAssertTrue(res == "15141210")
    }
    
    func testDateParsingInvalid() throws {
        let date = "iamnonono"
        let res = Helper.parseDate(dateToParse: date)
        
        print("invalid", res)
        XCTAssertTrue(res == "invalid date")
    }
}
