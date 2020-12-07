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
        
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Fatman")/*[[".cells.containing(.staticText, identifier:\"Rating: 6.0\")",".cells.containing(.staticText, identifier:\"Fatman\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).tap()
        
        app.buttons["Button"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Tenet").element/*[[".cells.containing(.staticText, identifier:\"Rating: 7.4\").element",".cells.containing(.staticText, identifier:\"2020-08-22\").element",".cells.containing(.staticText, identifier:\"Tenet\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Upside-Down Magic").element/*[[".cells.containing(.staticText, identifier:\"Rating: 7.6\").element",".cells.containing(.staticText, identifier:\"2020-07-31\").element",".cells.containing(.staticText, identifier:\"Upside-Down Magic\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
     
                                        
    }

}
