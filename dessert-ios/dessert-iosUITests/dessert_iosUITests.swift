//dessert_iosUITests.swift created on 28/06/2020.

import XCTest

class dessert_iosUITests: XCTestCase {
    
    let WHO_ARE_WE = "🤔 Who are we?"
    let WHY_DESSERT = "🍰 Why Dessert?"
    let QUICK_START = "🚀 Quickstart guide"
    let CLI_DOCS = "⚒️ CLI Documentation"

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }
    
    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.buttons["No account?"].exists)
        
        // Email text input
        XCTAssertTrue(app.staticTexts["Email"].exists)
        XCTAssertTrue(app.textFields["Enter email"].exists)
        
        // Password text input
        XCTAssertTrue(app.secureTextFields["Enter password"].exists)
        XCTAssertTrue(app.staticTexts["Password"].exists)

        // Buttons
        XCTAssertTrue(app.buttons["Login"].exists)
        XCTAssertTrue(app.buttons["No account?"].exists)
    }

    func testSliderContent() throws {
        let app = XCUIApplication()
        app.launch()
        // login
        app.buttons["Login"].tap()
        
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
        // Login button
        app.buttons["Login"].tap()

        // My Modules
        app.buttons["magnifyingglass"].tap()
        XCTAssertTrue(app.staticTexts["My Modules"].exists)
        
        // Profile
        app.buttons["person.fill"].tap()
        XCTAssertTrue(app.staticTexts["Profile"].exists)

        // Docs
        app.buttons["book.fill"].tap()
        XCTAssertTrue(app.staticTexts["Docs"].exists)
        
        // Home
        app.buttons["house.fill"].tap()
        XCTAssertTrue(app.staticTexts["Home"].exists)
        
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
        waitForExpectations(timeout: 10, handler: nil)
        
        docsButton.tap()

        // Wait for buttons to appear
        let label2 = app.buttons[WHO_ARE_WE]
        let exists2 = NSPredicate(format: "exists == 1")
        
        expectation(for: exists2, evaluatedWith: label2, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        allDocsButtonsExist(app: app)
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
