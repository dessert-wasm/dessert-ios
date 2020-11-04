//dessert_iosTests.swift created on 28/06/2020.

import XCTest
@testable import dessert_ios

class dessert_iosTests: XCTestCase {
    
    override func setUpWithError() throws {
        super.setUp()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testDateParsingValid() throws {
        let date = "2020-05-05T01:46:42.002Z"
        let res = Helper.parseDate(dateToParse: date)
        
        print("valid", res)
        XCTAssertTrue(res == "2020-05-05")
    }
    
    func testDateParsingInvalid() throws {
        let date = "iamnonono"
        let res = Helper.parseDate(dateToParse: date)
        
        print("invalid", res)
        XCTAssertTrue(res == "invalid date")
    }
    
    func testGithubLink() throws {
        let link = "https://raw.githubusercontent.com/ruby/ruby"
        let wanted = "https://raw.githubusercontent.com/ruby/ruby/master/README.md"
        let res = Helper.githubReadMe(link: link)
        
        XCTAssertTrue(res == wanted)
    }
    
    func testGithubRaw() throws {
        let link = "https://github.com/AlecAivazis/survey"
        let wanted = "https://raw.githubusercontent.com/AlecAivazis/survey"
        let res = Helper.githubToRaw(link: link)
        
        XCTAssertTrue(res == wanted)
    }
    
    func testNotGithubRaw() throws {
        let link = "https://iamnotgithub/AlecAivazis/survey"
        let res = Helper.githubToRaw(link: link)
        
        XCTAssertTrue(res == nil)
    }
    
    func testHTTPtoS() throws {
        let link = "http://iamatest.com"
        let wanted = "https://iamatest.com"
        let res = Helper.stepUpToHTTPS(markdown: link)
        
        XCTAssertTrue(res == wanted)
    }
}
