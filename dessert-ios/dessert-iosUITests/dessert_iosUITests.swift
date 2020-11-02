//dessert_iosUITests.swift created on 28/06/2020.

import XCTest

class dessert_iosUITests: XCTestCase {
    
    let WHO_ARE_WE = "🤔 Who are we?"
    let WHY_DESSERT = "🍰 Why Dessert?"
    let QUICK_START = "🚀 Quickstart guide"
    let CLI_DOCS = "⚒️ CLI Documentation"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSliderContent() throws {
        let app = XCUIApplication()
        app.launch()
        // login
        app.buttons["Login"].tap()
        
        // given
        let switchButton = app.switches["Showing 🔗"]
        let switchCore = app.staticTexts["Showing 💖"]
        let switchConnector = app.staticTexts["Showing 🔗"]
        
        if switchButton.isSelected {
            XCTAssertTrue(switchButton.exists)
            XCTAssertTrue(switchConnector.exists)
            switchCore.tap()
            XCTAssertTrue(switchCore.exists)
        }
    }
    
    func testMenuContent() throws {
        let app = XCUIApplication()
        app.launch()
        // login
        app.buttons["Login"].tap()
        
        // Home
        app.buttons["Home"].tap()
        XCTAssertTrue(app.staticTexts["Home"].exists)
        
        // My Modules
        app.buttons["magnifyingglass"].tap()
        XCTAssertTrue(app.staticTexts["My Modules"].exists)
        
        // Profile
        app.buttons["Profile"].tap()
        XCTAssertTrue(app.staticTexts["Profile"].exists)

        // Docs
        app.buttons["Docs"].tap()
        XCTAssertTrue(app.staticTexts["Docs"].exists)
    }
    
    func allDocsButtonsExist(app: XCUIApplication) {
        XCTAssertTrue(app.buttons[WHO_ARE_WE].exists)
        XCTAssertTrue(app.buttons[WHY_DESSERT].exists)
        XCTAssertTrue(app.buttons[QUICK_START].exists)
        XCTAssertTrue(app.buttons[CLI_DOCS].exists)
    }
    
    func testDocs() {
        let app = XCUIApplication()
        app.launch()
        // Login into the app
        app.buttons["Login"].tap()

        // Going to docs tab (and wait for login)
        let docsButton = app.buttons["book.fill"]
        let exists = NSPredicate(format: "exists == 1")

        expectation(for: exists, evaluatedWith: docsButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        docsButton.tap()

        // Wait for buttons to appear (and wait for login)
        let label2 = app.buttons[WHO_ARE_WE]
        let exists2 = NSPredicate(format: "exists == 1")
        
        expectation(for: exists2, evaluatedWith: label2, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        allDocsButtonsExist(app: app)
        
        // Testing Webview back and forth
        //let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        //let backButton = normalized.withOffset(CGVector(dx: 5, dy: 5))
        
        app.buttons[WHO_ARE_WE].tap()
        //print(app.navigationBars["Master"].buttons)
        //print("%%%%%%%%%%%%%%%%%%%%%%")
        //backButton.tap()
        
        //app.buttons[WHY_DESSERT].tap()
        //backButton.tap()
        
        //app.buttons[QUICK_START].tap()
        //backButton.tap()
        
        //app.buttons[CLI_DOCS].tap()
        //backButton.tap()
        
        //allDocsButtonsExist(app: app)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
