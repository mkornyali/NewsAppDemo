//
//  NewsRepoTest.swift
//  NewsAppUITests
//
//  Created by Mohamed Korany on 8/23/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//
/*
import XCTest
import Mockit

@testable import NewsApp

class NewsRepoTest: XCTestCase {
    
    
   // var sut:NewsListViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       // sut = NewsListViewModel()
        
       
    }
    
    
   

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTopHeadLins(){
        
        // given
        let networkMock = NetowrkMock()
        let sut = NewsRepo()
        sut.network = networkMock
        
        //when
        // let expect = XCTestExpectation(description: "callback")
        sut.topheadlines(country: "Egy", category: "sport", pageSize: 1, page: 1) { (result , error) in
            print(result?.articles?.count)
            //expect.fulfill()
            //XCTAssertNotNil(result)
            //XCTAssertEqual(result?.articles?.count, 19)
            
//            for item in result?.articles {
//                XCTAssertNotNil(item)
//            }
            
        }
      
        //wait(for: [expect], timeout: 3.01)
        
        // then
        XCTAssertTrue(networkMock.topHeadLinsCalled)
        //XCTAssertEqual(networkMock.request, NewsAPI.Type)
  
    }


    func testWithSwiftyMocky() {
//        let sut = NewsRepo()
//        let mock = NetworkMockSwifty()
        
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
