//
//  TestWithMockit.swift
//  NewsAppTests
//
//  Created by Mohamed Korany on 8/23/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import XCTest
import Mockit
@testable import NewsApp

/*
class TestWithMockit: XCTestCase {
    var networkMockit:NetworkMockMockit?
    var sut:NewsRepo?
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networkMockit = NetworkMockMockit(testCase: self)
        sut = NewsRepo()
        sut?.network = networkMockit
    }
    
    func testCallGetNewsMethodMockit(){
        //systemUnderTest.expectMethodOneAndThree()

//        call(withReturnValue: Result.self)
        sut?.topheadlines(country: "eg", category: "sport", pageSize: 20, page: 1, complitionHandler: { (result, error) in
 
        })
        
        networkMockit?.verify(verificationMode: Once()).fetchData(target: .topheadlines(country: "eg", category: "sport", pageSize: 20, page: 1), complitionHandler: { (r:Result?, a) in
    })
    }
    
    
    func testGetAllNewsMockit(){
        let expect = XCTestExpectation(description: "callback")
        sut?.topheadlines(country: "eg", category: "sport", pageSize: 20, page: 1, complitionHandler: { (result, error) in
        })
        
        networkMockit?.verify(verificationMode: AtLeastOnce()).fetchData(target: .topheadlines(country: "eg", category: "sport", pageSize: 20, page: 1), complitionHandler: { (r:Result?, error) in
            //XCTAssertNil(r?.articles!)
            expect.fulfill()
            XCTAssertNotNil(r)
            XCTAssertNotEqual(r?.articles?.count, 0)
            XCTAssertEqual(r?.articles?.count, 20)
            if let articles = r?.articles {
                for art in articles {
                    XCTAssertNotNil(art.url)
                    XCTAssertNotEqual(art.url, "")
                  //  XCTAssertEqual(art.url, "aa")
                }
            }
        })
        
        wait(for: [expect], timeout: 2)

    }
    
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        networkMockit = nil
        sut = nil
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
