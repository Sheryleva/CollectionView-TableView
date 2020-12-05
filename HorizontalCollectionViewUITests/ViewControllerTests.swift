//
//  ViewControllerTests.swift
//  HorizontalCollectionViewUITests
//
//  Created by Sheryl Evangelene Pulikandala on 12/4/20.
//

import XCTest

class ViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
       
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        
    }

    func testCollectionView() throws {
        
        let app = XCUIApplication()
        app.launch()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
        let button = app.buttons["Button"]
        button.tap()
        
        let element = collectionViewsQuery.children(matching: .cell).element(boundBy: 3).children(matching: .other).element
        element.swipeLeft()
        
        
    }
    
    func testTableView() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = XCUIApplication().tables
        let button = app.buttons["Button"]
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Fatman")/*[[".cells.containing(.staticText, identifier:\"Rating: 6.0\")",".cells.containing(.staticText, identifier:\"Fatman\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).tap()
        button.tap()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Vampire Virus"]/*[[".cells.staticTexts[\"Vampire Virus\"]",".staticTexts[\"Vampire Virus\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
             
                        
    }

}
