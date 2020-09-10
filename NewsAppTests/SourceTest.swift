//
//  RepoTest.swift
//  NewsAppUITests
//
//  Created by Mohamed Korany on 8/23/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//
/*
import XCTest
@testable import NewsApp

class SourceTest: XCTestCase {
    
    var sut: NewsRepo?
    
    override func setUpWithError() throws {
        super.setUp()
        
        sut = NewsRepo()
        sut?.network = NewtorkManger()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNewsSourcesList(){
        let sut = self.sut!
        let expect = XCTestExpectation(description: "callback")
        sut.getResources { (source, error) in
            expect.fulfill()
            XCTAssertEqual(source?.sources?.count, 128)
            if let sources = source?.sources {
                for s in sources {
                    XCTAssertNotNil(s.id)
                }
            }
            //
        }
        wait(for: [expect], timeout: 2.1)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
*/
