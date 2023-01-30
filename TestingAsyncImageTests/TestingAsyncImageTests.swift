//
//  TestingAsyncImageTests.swift
//  TestingAsyncImageTests
//
//  Created by Filip Jabłoński on 30/01/2023.
//

import XCTest
import SnapshotTesting
@testable import TestingAsyncImage

final class TestingAsyncImageTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let bundle = Bundle(for: type(of: self))
        let iconUrl = bundle.url(forResource: "testImage", withExtension: "png")!
        let view = ContentView(viewModel: MainViewModel(model: Model(id: Int.random(in: 0...3456), iconURL:iconUrl)))
        assertSnapshots(matching: view, as: [.wait(for: 2, on: .image)])
        
    }

}
