//
//  PlayingMoviesTests.swift
//  HorizontalCollectionViewTests
//
//  Created by Sheryl Evangelene Pulikandala on 12/4/20.
//

import XCTest
@testable import HorizontalCollectionView

class PlayingMoviesTests: XCTestCase {
    
    var sut: APIhandler?
    var protocolTo: ProtocolToPassData?
    let mockSession = MockSession()
    
    override func setUpWithError() throws {
        sut = APIhandler.init(delegate: ViewController(), session: mockSession)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testFetchTodoItemsWithoutExpectation() {
        let mockSession = MockSession()
        let sut = APIhandler(delegate: ViewController(), session: mockSession)
        XCTAssertNotNil(sut.getDataFromAPI)
    }

}

class MockSession: SessionProtocol {
    func fetchData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let movies = Movie(popularity: 10, votes: 10, image: "", backdrop_path: "", lang: "", orgTitle: "My title", title: "My title", vote_average: 10, overview: "", release: "")
        let todo = MoviesInfo(results: [movies])
        let data = try? JSONEncoder().encode([todo])
        completion(data, nil, nil)
    }
}
